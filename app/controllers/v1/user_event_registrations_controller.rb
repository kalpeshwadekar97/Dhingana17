class V1::UserEventRegistrationsController < ApiController
  before_action :authenticate_user
  before_action :set_user_event_registration, only: [:show, :update, :destroy]
  before_action :set_fields, only: [:index, :show]
  
  def index
    @user_event_registrations = UserEventRegistration.includes(set_includes).limit(50).offset(offset).all.order("user_event_registrations.id desc")
    user_event_registrations_filter
    @total_result = @user_event_registrations.count
  end

  def show
  end
  
  def create
    key = "order:#{current_user.id}"
    return render_api_error(22,400,'error', "registration in progress") if $redis.get(key).present?
    $redis.set(key, "active") 
    $redis.expire(key, 30)
    @user_event_registration = UserEventRegistration.new(user_event_registration_params)
    if @user_event_registration.save
      render :show, status: :created
    else
      render_api_error(22,400,'error',@user_event_registration.errors)
    end
  end

  def update 
    if @user_event_registration.update(user_event_registration_params)
      render :show, status: :ok
    else
      render_api_error(22,400,'error',@user_event_registration.errors)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user_event_registration
      @user_event_registration = UserEventRegistration.where(user: current_user).find(params[:id])
    end

    def user_event_registrations_filter
      @user_event_registrations = @user_event_registrations.where(user: current_user)
    end

    def set_includes
      include = []
      include
    end

    def set_fields
      all_fields = params["fields"].present? ? params["fields"].split(',').collect(&:strip) : []
      @fields = (all_fields & (UserEventRegistration.attribute_names)) | ["id", "created_at", "user_id", "event_id"]
      @additional_fields = all_fields & UserEventRegistration.reflect_on_all_associations.map {|object| object.name.to_s} | []
    end

    def user_event_registration_params
      user_event_registration_hash = params.require(:user_event_registration).permit(:event_id, :payment_gateway, :user_id)
      user_event_registration_hash[:user_id] = current_user.id
      user_event_registration_hash
    end
  
end
