json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :date
  json.url meeting_url(meeting, format: :json)
end
