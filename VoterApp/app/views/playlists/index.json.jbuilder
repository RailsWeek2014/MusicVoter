json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :title, :code, :description
  json.url playlist_url(playlist, format: :json)
end
