class V1::AuthenticationController < ApiController
  before_action :class_name
  before_action :authenticate_user, only:[:destroy]
  after_action :update_user_device, only: [:create]
  include AuthenticationModule

  def update_user_device
    if @user.present? and params[:device].present? and params[:device][:device_id].present?
       @device_data=Device.where("device_id": params[:device][:device_id]).first
       @device_data.update("user_id": @user.id)   if @device_data.present?
    end
  end  

  private
    def class_name
      @user_class = @user_class || User
    end
end
