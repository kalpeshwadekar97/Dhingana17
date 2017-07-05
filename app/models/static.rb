class Static 

  def self.home
    data = [
      { id: 1, url:'http://lorempixel.com/400/200/', title:'banner'},
      { id: 2, url:'http://lorempixel.com/400/200/', title:'roads'},
      { id: 3, url:'http://lorempixel.com/400/200/', title:'places'},
      { id: 4, url:'http://lorempixel.com/400/200/', title:'restuarants'}
    ]
  end

  def self.faq
    STATIC_CONFIG["faq"]
  end

  def self.roads
    STATIC_CONFIG["roads"]
  end

  def self.places
    STATIC_CONFIG["places"]
  end
end