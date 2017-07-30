class Static 
  def self.home
    data = {
      "home_banner":{
          id: 1,
          url: "https://s3.ap-south-1.amazonaws.com/dhingana/Home/home_banner.jpg"
        },
      "home":[
          { id: 1, url:'https://s3.ap-south-1.amazonaws.com/dhingana/Home/home_boxes_beaches.jpg', title:'beaches'},
          { id: 2, url:'https://s3.ap-south-1.amazonaws.com/dhingana/Home/home_boxes_roads.jpg', title:'roads'},
          { id: 3, url:'https://s3.ap-south-1.amazonaws.com/dhingana/Home/home_boxes_spirituals.jpg', title:'spiritual'},
          { id: 4, url:'https://s3.ap-south-1.amazonaws.com/dhingana/Home/home_boxes_sancturies.jpg', title:'scanturies'},
          { id: 5, url:'https://s3.ap-south-1.amazonaws.com/dhingana/Home/home_boxes_forts.jpg', title:'historical'}
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
    {title: 'Beaches',description: 'Beaches have a similar gesture of washing away sins. It is believed that a dip in the waters of  these Beaches washes away all the sins in one''s life.
            These tertiary sedimentary formation cliffs are a unique geological feature on the otherwise Shrivardhan coast, and is known among geologists as Konkan a geological monument as declared by the Geological Survey of India. There are numerous water spouts and spas on the sides of these cliffs. So here are some beaches, The Alibaug, Varsoli, Nagao, Kashid and many more dams. These beaches are haven for sun-bathing and swimming. The evening views of the sunset are worth lingering over. ', data: STATIC_CONFIG["beaches"] }
  end

  def self.historical
    {title: 'Historical Places',description: 'Konkan also know as kokan  is situated in the western coastline region of India. Its full of famous sculptures, status, Ghats and historical places. The ancient Saptakonkana is a slightly larger region. 
              According to the Sahyadrikhanda of the Skanda Purana, Parashurama shot his arrow into the sea and commanded the Sea God to recede up to the point where his arrow landed. The new piece of land thus recovered came to be known as Sapta-Konkana, meaning "piece of earth", "corner of earth", or "piece of corner", derived from Sanskrit words: koṇa 
              Konkan extends throughout the western coasts of Maharashtra, Goa and Karnataka.It is bounded by the Western Ghats (also known as Sahyadri) in the east, the Arabian Sea in the west, the Mayura River in the north and the Gangavalli River in the south. Due to which many of the historical places are seen here such as Karnala Fort, Revdanada Fort, Korlai Fort. As the konkan ecosystem is atmospheric natural and amazing so do visit and enjoy the livings of natural beauty of coastal and konkan region.', data: STATIC_CONFIG["historical"] }
  end

  def self.spiritual
    {title: 'Spiritual Places', description: 'Sacred travel, or metaphysical tourism, spiritualized travel, is a growing niche of the travel market. It attracts New Age believers and involves tours and travel to spiritual hotspots on the Earth.
            Destinations are often ancient sites where there is a mystery concerning their origin or purpose, such as Shitaladevi Temple, choul. Birla Mandir, Visrgi Mosque, Adhal. Siddhivinayak Temple. 
            Travelling through these routes, travelers see the journey as more than just tourism and take the trips in order to heal themselves . Part of this may involve rituals involving (supposedly) leaving their bodies, possession by spirits , and recovery of past life memories.', data: STATIC_CONFIG["spiritual"] }
  end

  def self.scanturies
    {title: 'Wildlife & Bird Sanctuaries', description: 'Sanctuaries, are naturally occurring Heaven on Earth, such as an island, that provides protection for species from hunting, predation or competition.These are protected area, a geographic territory within which wildlife is protected. The Indian Forest Department and Wildlife Service defines a Wildlife and Bird Sanctuaries. 
            On these tour and trips, here are some heavenly touched Sanctuaries which can amaze you with beauty, Karnala Bird Sanctuary, Phansad Wildlife Sanctuary. There are some biodiversity natural gardens and fish farm in the atmospheric surrounding which can flourish you frame of mind into refreshing deeds. ', data: STATIC_CONFIG["scanturies"] }
  end

  def self.terms_and_conditions
    {title: 'Terms & Conditions',data: STATIC_CONFIG["terms and conditions"] }
  end

  def self.contact_us
    {title: 'Contact Us',data: STATIC_CONFIG["contact_us"] }
  end

  def self.payment_numbers
    { data: STATIC_CONFIG["payment_details"] }
  end

  def self.community
    {communityData: STATIC_CONFIG["community"] }
  end

end