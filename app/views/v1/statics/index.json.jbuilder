if @fields.include? "home"
  json.home_data Static.home
end

if @fields.include? "faq"
  json.faq Static.faq
end
