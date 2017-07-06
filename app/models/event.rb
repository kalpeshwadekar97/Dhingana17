class Event < ActiveRecord::Base
  enum status: [:"comming soon", :ongoing, :completed, :cancelled]

  def images
    data = [
      { id: 1, url:'http://lorempixel.com/640/480/'},
      { id: 2, url:'http://lorempixel.com/640/480/'},
      { id: 3, url:'http://lorempixel.com/640/480/'},
      { id: 4, url:'http://lorempixel.com/640/480/'}
    ]
  end

  def can_register
    details = {}
    details['register'] = ( self.status == "comming soon" || self.status == "ongoing" ) ? true : false
    details['button_title'] =  details['register'] ? "Register" : "House Full"
    details
  end
end