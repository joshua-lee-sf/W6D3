# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :ArtWork,
    dependent: :destroy,
    inverse_of: :artist

  has_many :views,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :viewer

  has_many :shared_artworks,
    through: :artworks,
    source: :artwork_shares

  has_many :shared_viewers,
    through: :views,
    source: :viewer
  
  has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment,
    dependent: :destroy,
    inverse_of: :author

  has_many :likes,
    foreign_key: :user_id,
    class_name: :Like,
    dependent: :destroy

  def self.username_finder(username)
    User.where('username = (?)', username)
  end
end
