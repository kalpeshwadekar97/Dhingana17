  module Authentication
  extend ActiveSupport::Concern
  attr_accessor :ip, :sign_in_at, :no_validate
  included do
    before_save :ip_update, if: lambda {|user| user.ip.present? }
    before_save :sign_in_time_update, if: lambda { |user| user.sign_in_at.present?}
    end

   module ClassMethods
    def check_inactive(email)
      set_inactive_user_in_redis unless $redis.exists(inactive_user_key)
      eval($redis.get(inactive_user_key)).exclude?(email)
    end
    def generate_access_token
      token = SecureRandom.uuid.tr('-','')
    end

    def check_redis_token(email,token,device)
      is_valid_user = false
      if email.present? and check_inactive(email)
        key = "#{self.name.underscore}:#{token}"
        redis_data = $redis.hget(key,"email")
        if redis_data.present? and email.casecmp(redis_data).zero?
          is_valid_user = true
        end
      end

      if is_valid_user
        expire_time = APP_CONFIG['session_expiry'][device] || APP_CONFIG['session_expiry']['default']
        $redis.expire(key, expire_time) if expire_time > 0
        user_object = Marshal.restore($redis.hget(key,self.name.underscore))
        if !user_object.has_attribute?("non_promotional_wallet_amount") || !user_object.has_attribute?("promotional_wallet_amount")
            user_object = user_object.reload
        end
        return user_object
      else
        return false
      end
    end
  end

  def set_redis_session(token, expire_time = 0, set_on_live = false)
    key = "#{class_name_underscore}:#{token}"
    $redis.hset(key, class_name_underscore, Marshal.dump(self))
    $redis.hset(key, "email", self.email)
    $redis.expire(key, expire_time) if expire_time > 0
    if set_on_live
      $redis_live.hset(key, class_name_underscore, Marshal.dump(self))
      $redis_live.hset(key, "email", self.email)
      $redis_live.expire(key, expire_time) if expire_time > 0
    end
    return user_show(token)
  end

  def authenticate(authentication_params = nil)
    password = authentication_params[:password] || ""
    authentication_params[:status] = true  if authentication_params[:otp_code].present? and verify_otp(authentication_params)
    condition = authentication_params[:status] == true || self.encrypted_password == class_object.encrypt_password(password) || self.encrypted_password == class_object.encrypt_password(Rails.application.secrets.encrption_key+password)
    if condition and condition_can_login
      user_update = {ip: authentication_params[:ip].try(:slice), sign_in_at: Time.current, no_validate: true }
      self.update(user_update)
      devices = authentication_params[:devices] if authentication_params[:devices].present?
      devices = [authentication_params[:device]] if authentication_params[:device].present?
      expire_time = APP_CONFIG['session_expiry'][authentication_params[:device]] || APP_CONFIG['session_expiry']['desktop']
      token = class_object.generate_access_token
      session_status={}
      devices.each do |device|
        @device = device
        session_status = set_redis_session(token, expire_time, authentication_params[:set_on_live])
      end
      return session_status
    else 
      return false
    end
  end

  def user_show(token=nil)
    return @user_show if @user_show.present?
    @user_show  = self.attributes.symbolize_keys.slice(:id, :first_name, :last_name, :gender, :date_of_birth, :email, :can_sales_login, :mobile, :non_promotional_wallet_amount)
    @user_show[:gender] = @user_show[:gender].present? ? class_object.genders.invert[@user_show[:gender].to_i] : nil 
    @user_show[:token] = token
    @user_show
  end

  def destroy_session(token,device)
    key = "#{class_name_underscore}:#{token}:#{device}"
    if $redis.del(key)
      return true
    else
      return false
    end
  end

  def ip_update
    self.current_sign_in_ip, self.last_sign_in_ip = self.ip , self.current_sign_in_ip_was
  end

  def sign_in_time_update
    self.current_sign_in_at , self.last_sign_in_at = self.sign_in_at , self.current_sign_in_at_was
  end

  def check_user_exists(params)
    if (self.mobile == params["mobile"].to_s) || (!User.exists?(:mobile => params["mobile"]))
      return true
    else
      self.errors.add(:mobile, APP_CONFIG["error"][45])
      return false
    end      
  end  

  def generate_otp(params)
    otp = rand(9999).to_s.center(4, rand(9).to_s)
    key = "#{class_name_underscore}:#{params["mobile"]}:#{otp}"
    all_keys = $redis.keys("user:#{params["mobile"]}*")
    if (APP_CONFIG["sms"]["no_otp_verification"].exclude? params["mobile"])  
      if all_keys.count > 2
        self.errors.add(:OTP, APP_CONFIG["error"][46])
        return false
      else
        $redis.set(key, otp)
        $redis.expire(key,600)
        ExternalApi::Queue::Publisher.send_sms("otp", {"otp" => otp}, params["mobile"])
        return true
      end
    end
    ExternalApi::Queue::Publisher.send_sms("otp", {"otp" => otp}, params["mobile"])
    return true    
  end  

  def verify_otp(params)
    key = "#{class_name_underscore}:#{params["mobile"]}:#{params[:otp_code]}"
    redis_data = $redis.get(key)
    if redis_data.present? and redis_data == params[:otp_code]
      self.update({:mobile => params["mobile"]})
      $redis.del($redis.keys("#{class_name_underscore}:#{params["mobile"]}*"))
      return true
    else 
      self.errors.add(:OTP, APP_CONFIG["error"][47])
      return false
    end  
  end

  private

    def class_object
      Object.const_get(self.class.name)
    end

    def class_name_underscore
      @class_name = @class_name || self.class.name.underscore
    end
end