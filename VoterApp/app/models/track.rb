class Track < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :user
  has_many :votes, through: :user
  validates :url, uniqueness: true
end
