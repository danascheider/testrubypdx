json.array!(@talks) do |talk|
  json.extract! talk, :id, :date, :title, :description
  json.url talk_url(talk, format: :json)
end
