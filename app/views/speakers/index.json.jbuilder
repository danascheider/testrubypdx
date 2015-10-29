json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :first_name, :last_name, :website, :company
  json.url speaker_url(speaker, format: :json)
end
