json.array!(@tracks) do |track|
  json.extract! track, :id, :title, :url, :length, :votes
  json.url track_url(track, format: :json)
end
