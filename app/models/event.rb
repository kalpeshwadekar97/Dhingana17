class Event < ActiveRecord::Base
  enum status: [:"comming soon", :ongoing, :completed, :cancelled]

  def images
    data = [
      { id: 1, url:'https://s3.ap-south-1.amazonaws.com/dhingana/Events/1.jpg'}
    ]
  end

  def can_register
    details = {}
    details['register'] = ( self.status == "comming soon" || self.status == "ongoing" ) ? true : false
    details['button_title'] =  details['register'] ? "Register" : "House Full"
    details
  end
end