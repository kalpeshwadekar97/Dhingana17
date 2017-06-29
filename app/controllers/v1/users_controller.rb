class V1::UsersController < ApiController
  before_action :authenticate_user, except: [:create]
  before_action :set_user, only: [:show, :update]

  def show
  end

  # POST /v1/users
  # POST /v1/users.json
  def create
    @user = User.external(user_params, request.headers["HTTP_APP_VERSION"].to_i)
     if @user.errors.blank?
      render json: @user.user_show, status: :created
      if params[:device].present? and params[:device][:device_id].present?
       @device_data=Device.where("device_id": params[:device][:device_id]).first
       @device_data.update("user_id": @user.id)   if @device_data.present?
      end
    else
      render_api_error(11, 401, "error", @user.try(:errors))
    end
  end

  # PATCH/PUT /v1/users/1
  # PATCH/PUT /v1/users/1.json
  def update
    @user.token = @token
    @user.no_validate = true
    if @user.update(user_params)
       render json: @user, status: :ok 
    else
        @user.errors.messages[:message]= {}      
        return render json: {error: @user.errors}, status: :unprocessable_entity
    end  
  end

  private

  def set_user
      @user = current_user.reload
  end
    
  def user_params
    user_hash = params.require(:user).permit(:password, :new_password, :first_name, :last_name, :gender, :mobile, :facebook_id, :google_id, :email, :old_password, :action)
    user_hash[:device_type] = @device
    if !user_hash[:password].present? and user_hash[:new_password].present?
      user_hash[:password] = user_hash[:new_password]
      user_hash = user_hash.except(:new_password)
    end
    user_hash
  end
end
