class Playlist < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { minimum: 4, too_short: "Muss min. 4 Zeichen sein" }
  validates :code, length: { minimum: 4, too_short: "Muss min. 4 Zeichen sein"}, uniqueness: true
  validates :beschreibung, length: { maximum: 500, too_long: "Max. 500 Zeichen" }
end
