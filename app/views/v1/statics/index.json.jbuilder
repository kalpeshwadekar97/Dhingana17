if @fields.include? "home"
  json.home Static.home
end

if @fields.include? "faq"
  json.faq Static.faq
end
