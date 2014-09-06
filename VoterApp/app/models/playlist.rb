class Playlist < ActiveRecord::Base
  after_initialize :create_player

  belongs_to :user
  has_one :player
  has_many :tracks
  validates :title, length: { minimum: 4, too_short: "Muss min. 4 Zeichen sein" }
  validates :code, length: { minimum: 4, too_short: "Muss min. 4 Zeichen sein"}, uniqueness: true
  validates :beschreibung, length: { maximum: 500, too_long: "Max. 500 Zeichen" }

  private
  def create_player
    player = Player.new()
    player.playlist = self
    player.save
  end
end
