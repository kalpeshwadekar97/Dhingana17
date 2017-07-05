json.array!(@events) do |event|
  @fields.each do |key|
    json.(event, key.to_sym)
  end
end