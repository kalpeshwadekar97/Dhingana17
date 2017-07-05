if @fields.include? "home"
  json.home Static.banner_images
end

if @fields.include? "faq"
  json.faq Static.faq
end
