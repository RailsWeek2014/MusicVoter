json.array!(@vote_tracks) do |vote_track|
  json.extract! vote_track, :id, :user_id, :track_id
  json.url vote_track_url(vote_track, format: :json)
end
