class Playlist < ActiveRecord::Base
  after_create :create_player_and_moderator
  belongs_to :user
  has_one :player
  has_many :tracks
  validates :title, length: { minimum: 4, too_short: "Muss min. 4 Zeichen sein" }
  validates :code, length: { minimum: 4, too_short: "Muss min. 4 Zeichen sein"}, uniqueness: true
  validates :description, length: { maximum: 500, too_long: "Max. 500 Zeichen" }

  private
  def create_player_and_moderator
    player = Player.new()
    player.playlist = self
    player.save
    m = Moderator.new()
    m.playlist_id = self.id
    m.user_id= self.user.id
    m.save
  end
end
