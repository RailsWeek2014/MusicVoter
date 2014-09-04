json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :title, :playlistCode, :beschreibung
  json.url playlist_url(playlist, format: :json)
end
