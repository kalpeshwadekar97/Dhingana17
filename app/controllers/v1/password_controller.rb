class V1::PasswordController < ApiController
  before_action :initialize_class_name
  skip_before_action :authenticate_user, only: [:create, :new], raise: false
  include PasswordModule

  private
    def initialize_class_name
      @user_class = @user_class || User
    end
end
