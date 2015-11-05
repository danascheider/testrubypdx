json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :address_1, :address_2, :city, :state, :zip
  json.url venue_url(venue, format: :json)
end
