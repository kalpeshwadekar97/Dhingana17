if @fields.include? "banner_images"
  json.banner_images Static.banner_images
end

if @fields.include? "faq"
  json.faq Static.faq
end
