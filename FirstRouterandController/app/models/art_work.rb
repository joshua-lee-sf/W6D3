# == Schema Information
#
# Table name: art_works
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :bigint           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class  ArtWork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  # validates [:title, :artist_id], uniqueness: true

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    foreign_key: :art_work_id,
    class_name: :ArtworkShare,
    dependent: :destroy
end
