class User < ActiveRecord::Base

  #concerns
  include Password
  include Authentication
  include UserObserver
  #relations
  has_many :user_event_registrations
  has_one :admin_user, foreign_key: :email, primary_key: :email
  #has_many :user_feedback
  #validation
  validates_presence_of :first_name, :last_name, :email, :mobile, if: lambda {|user| !user.no_validate}, on: :create
  validates_uniqueness_of :email, if: lambda{ |user| user.email_changed?}
  validates_uniqueness_of :mobile, if: lambda{ |user| user.mobile_changed?} , :message => APP_CONFIG["error"][45]
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: APP_CONFIG["error"][50], on: :create }
  validate :freeze_email, on: :update
  before_save :strip_whitespace
  before_save { |user| user.email.downcase! }
  after_save :set_inactive_user_in_redis, if: lambda {|user| user.status_changed? and user.inactive?}
  before_validation :set_status,  on: :create, if: lambda {|user| user.status.blank? }
  after_save :update_redis_token, if: lambda {|user| user.token.present? }
  
  #enum
  enum status: [:inactive, :active, :verified] 
  enum email_status: [:email_new, :email_mail_sent, :email_active, :email_inactive, :email_unsubscribed, :email_invalid, :email_unsent]
  enum mobile_status: [:mobile_new, :mobile_sms_sent, :mobile_active, :mobile_inactive, :mobile_unsubscribed, :mobile_invalid, :mobile_unsent]
  enum gender: [:female, :male]
  enum device_type: [:desktop, :mobile_site, :android, :ios]
  enum blacklist_user: [:disabled, :enabled]

  attr_accessor :token

  def update_redis_token
    expire_time = APP_CONFIG['session_expiry']["desktop"]
    set_redis_session(token, expire_time)
  end

  def freeze_email
    errors.add(:email, "cannot be Modifed") if self.email_changed? and (self.email_was.casecmp(self.email).zero? )
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  def set_status
  self.status = 1
  end

  def self.inactive_user_key
    "inactive_user"
  end
  
  def set_inactive_user_in_redis
    User.set_inactive_user_in_redis
  end
  
  def self.set_inactive_user_in_redis
    $redis.set(User.inactive_user_key,User.where(status: 0).pluck(:email).to_json)
  end

  def condition_can_login
    !self.inactive?
  end

  def self.external(params, version=0)
    response = {}
    response = ExternalApi::Authentication::Facebook.new(params[:facebook_id]).get_response if params[:facebook_id].present?
    response = ExternalApi::Authentication::Google.new(params[:google_id]).get_response if params[:google_id].present?
    email = response["email"] || params["email"]
    status = response["email"].present? ? true : false
    user = User.find_by(email: email.downcase)
    if user.present?
      if !response.present? and (params[:device_type] != "android" || (params[:device_type] == "android" and version>=33) )
        user.errors.add(:email, APP_CONFIG["error"][43])
        return user
      end
      user.update(response)
    else
      params.merge!(response)
      user = User.create(params)
    end
    user.authenticate(params.merge!({status: status, device: params[:device_type]}))
    user
  end

  def strip_whitespace
    self.first_name = self.first_name.strip unless self.first_name.nil?
    self.last_name = self.last_name.strip unless self.last_name.nil?
    self.email = self.email.strip unless self.email.nil?
  end  

  def no_event_message
    return "You have not registered for any event."
  end

end
