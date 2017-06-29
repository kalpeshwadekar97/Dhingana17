module UserObserver
  extend ActiveSupport::Concern
  included do 
    #after_create :deliver_user_register_mail
  end
  
  def deliver_user_register_mail
    # UserMailer.user_register(self.id).deliver
  end
end