json.array!(@user_event_registrations) do |user_event_registration|
  @fields.each do |key|
    json.(user_event_registration, key.to_sym)
  end
end