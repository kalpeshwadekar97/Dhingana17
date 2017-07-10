class UserEventRegistration < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  
  validates_uniqueness_of :event_id, :scope => :user_id, :message => 'Already registered for event'
  enum status: ["registered", "completed", "cancelled"]

  before_create :set_status

  def set_status
    self.status = 0
  end
end