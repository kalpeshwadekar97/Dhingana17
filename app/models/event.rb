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
end