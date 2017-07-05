class Static 

  def self.banner_images
    data = [
      {id: 1,url: 'http://lorempixel.com/400/200/','title':'banner'},
      {id: 2,url: 'http://lorempixel.com/400/200/','title':'roads'},
      {id: 3,url: 'http://lorempixel.com/400/200/','title':'places'},
      {id: 4,url: 'http://lorempixel.com/400/200/','title':'restuarants'}
    ]
  end

  def self.faq
    STATIC_CONFIG["faq"]
  end
end