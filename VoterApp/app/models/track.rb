class Track < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :user
  has_many :vote_tracks, through: :user
  #validates :url, uniqueness: true
  #validates :title, uniqueness: true
end
