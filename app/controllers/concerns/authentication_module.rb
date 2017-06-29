module AuthenticationModule
  extend ActiveSupport::Concern
  
  def create
    params[:authentication][:device]= @device
     @user = current_user || @user_class.find_by(authentication_params.slice(:email, :mobile)) 
      return_data = @user.authenticate(authentication_params) if @user.present?
      if @user.present? and return_data.present?
          render json: return_data, status: :created
      else
          (@user.try(:errors).present? and @user.try(:errors)["OTP"].present?) ? render_api_error(11, 400, "error", @user.try(:errors)) : render_api_error(49, 401)
    end
  end

  def update
    
  end

  def destroy
    if current_user.destroy_session(@token, @device)
      render json: {message: "Sign Out successful"}, status: :ok
    else
      render_api_error(15, 500, "error", "Sign Out Failed")
    end
  end

  private

    def authentication_params
      params.require(:authentication).permit(:password, :email, :device, :ip, :facebook_id, :google_id, :mobile, :otp_code)
    end
end