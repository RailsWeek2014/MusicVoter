# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "aladin@atalla.de", password: "12345678")
Playlist.create!(title: "Meine erste Playlist", code: "2133", beschreibung:"Beschreibung", user: User.find(1))