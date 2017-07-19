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
    {title: 'Roads',description: 'Sacred travel, or metaphysical tourism, spiritualized travel, is a growing niche of the travel market. It attracts New Age believers and involves tours and travel to spiritual hotspots on the Earth.
            Destinations are often ancient sites where there is a mystery concerning their origin or purpose, such as Shitaladevi Temple, choul. Birla Mandir, Visrgi Mosque, Adhal. Siddhivinayak Temple. 
            Travelling through these routes, travelers see the journey as more than just tourism and take the trips in order to heal themselves . Part of this may involve rituals involving (supposedly) leaving their bodies, possession by spirits , and recovery of past life memories.', data: STATIC_CONFIG["roads"] }
  end

  def self.beaches
    {title: 'Beaches',description: 'Sacred travel, or metaphysical tourism, spiritualized travel, is a growing niche of the travel market. It attracts New Age believers and involves tours and travel to spiritual hotspots on the Earth.
            Destinations are often ancient sites where there is a mystery concerning their origin or purpose, such as Shitaladevi Temple, choul. Birla Mandir, Visrgi Mosque, Adhal. Siddhivinayak Temple. 
            Travelling through these routes, travelers see the journey as more than just tourism and take the trips in order to heal themselves . Part of this may involve rituals involving (supposedly) leaving their bodies, possession by spirits , and recovery of past life memories.', data: STATIC_CONFIG["beaches"] }
  end

  def self.history
    {title: 'Historical Places',description: 'Sacred travel, or metaphysical tourism, spiritualized travel, is a growing niche of the travel market. It attracts New Age believers and involves tours and travel to spiritual hotspots on the Earth.
            Destinations are often ancient sites where there is a mystery concerning their origin or purpose, such as Shitaladevi Temple, choul. Birla Mandir, Visrgi Mosque, Adhal. Siddhivinayak Temple. 
            Travelling through these routes, travelers see the journey as more than just tourism and take the trips in order to heal themselves . Part of this may involve rituals involving (supposedly) leaving their bodies, possession by spirits , and recovery of past life memories.', data: STATIC_CONFIG["historical"] }
  end

  def self.spiritual
    {title: 'Spiritual Places', description: 'Sacred travel, or metaphysical tourism, spiritualized travel, is a growing niche of the travel market. It attracts New Age believers and involves tours and travel to spiritual hotspots on the Earth.
            Destinations are often ancient sites where there is a mystery concerning their origin or purpose, such as Shitaladevi Temple, choul. Birla Mandir, Visrgi Mosque, Adhal. Siddhivinayak Temple. 
            Travelling through these routes, travelers see the journey as more than just tourism and take the trips in order to heal themselves . Part of this may involve rituals involving (supposedly) leaving their bodies, possession by spirits , and recovery of past life memories.', data: STATIC_CONFIG["spiritual"] }
  end

  def self.wildlife
    {title: 'Wildlife & Bird Sanctuaries', description: 'Sacred travel, or metaphysical tourism, spiritualized travel, is a growing niche of the travel market. It attracts New Age believers and involves tours and travel to spiritual hotspots on the Earth.
            Destinations are often ancient sites where there is a mystery concerning their origin or purpose, such as Shitaladevi Temple, choul. Birla Mandir, Visrgi Mosque, Adhal. Siddhivinayak Temple. 
            Travelling through these routes, travelers see the journey as more than just tourism and take the trips in order to heal themselves . Part of this may involve rituals involving (supposedly) leaving their bodies, possession by spirits , and recovery of past life memories.', data: STATIC_CONFIG["wildlife"] }
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