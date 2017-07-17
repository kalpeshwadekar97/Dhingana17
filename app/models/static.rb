class Static 
  def self.home
    data = {
      "home_banner":{
          id: 1,
          url: "http://lorempixel.com/800/600/"
        },
      "home":[
          { id: 1, url:'http://lorempixel.com/400/200/', title:'banner'},
          { id: 2, url:'http://lorempixel.com/400/200/', title:'roads'},
          { id: 3, url:'http://lorempixel.com/400/200/', title:'places'},
          { id: 4, url:'http://lorempixel.com/400/200/', title:'restuarants'}
        ]
      }
  end

  def self.faq
    STATIC_CONFIG["faq"]
  end

  def self.roads
    {title: 'Roads',data: STATIC_CONFIG["roads"] }
  end

  def self.beaches
    {title: 'Beaches',data: STATIC_CONFIG["beaches"] }
  end

  def self.history
    {title: 'Historical Places',data: STATIC_CONFIG["historical"] }
  end

  def self.spiritual
    {title: 'Spiritual Places',data: STATIC_CONFIG["spiritual"] }
  end

  def self.wildlife
    {title: 'Wildlife & Bird Sanctuaries',data: STATIC_CONFIG["wildlife"] }
  end

  def self.terms_and_conditions
    {title: 'Terms & Conditions',data: STATIC_CONFIG["terms and conditions"] }
  end

  def self.contact_us
    {title: 'Contact Us',data: STATIC_CONFIG["contact_us"] }
  end

  def self.payment_numbers
    { data: STATIC_CONFIG["payment_mobile_numbers"] }
  end

  def self.community
    {communityData: STATIC_CONFIG["community"] }
  end

end