# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "aladin@atalla.de", password: "12345678")
User.create!(email: "hi@hallo.de", password: "12345678")
Playlist.create!(title: "Meine erste Playlist", code: "2133", description:"description", user: User.find(1))
#Moderator.create!(playlist_id: Playlist.find(1).id, user_id: User.find(1).id)