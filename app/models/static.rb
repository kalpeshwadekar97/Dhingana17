class Static 
  def self.home
    data = {
      "home_banner":{
          id: 1,
          url: "https://s3.ap-south-1.amazonaws.com/dhingana/home_banner.jpg"
        },
      "home":[
          { id: 1, url:'https://s3.ap-south-1.amazonaws.com/dhingana/home_boxes_beaches.jpg', title:'beaches'},
          { id: 2, url:'https://s3.ap-south-1.amazonaws.com/dhingana/home_boxes_roads.jpg', title:'roads'},
          { id: 3, url:'https://s3.ap-south-1.amazonaws.com/dhingana/home_boxes_spirituals.jpg', title:'spiritual places'},
          { id: 4, url:'https://s3.ap-south-1.amazonaws.com/dhingana/home_boxes_sancturies.jpg', title:'scanturies'},
          { id: 5, url:'https://s3.ap-south-1.amazonaws.com/dhingana/home_boxes_forts.jpg', title:'forts'}
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