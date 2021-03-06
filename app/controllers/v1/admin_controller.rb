class V1::AdminController < ApiController
  before_action :authenticate_user

  def authenticate_user
    access_token = request.headers["HTTP_ACCESS_TOKEN"].present? ? request.headers["HTTP_ACCESS_TOKEN"] : params[:t]
    token,email = Base64.decode64(access_token).split(/:/, 2) if access_token.present?
    @admin_user = AdminUser.check_redis_token(email,token,@device)
    unless @admin_user
       render_api_error(10,401)
    end
  end

  def current_user
    @admin_user = @admin_user || get_user
  end

  def get_user
    token , email = Base64.decode64(request.headers["HTTP_ACCESS_TOKEN"]).split(/:/, 2) if request.headers["HTTP_ACCESS_TOKEN"].present?
    @admin_user if @admin_user = AdminUser.check_redis_token(email,token,@device)
  end
end