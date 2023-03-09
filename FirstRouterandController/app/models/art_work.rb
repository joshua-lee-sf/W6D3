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


#Implementing this functionality requires a more complex database query, 
#but you want to keep your controllers lean; the logic required for complex queries belongs 
#more with the model. Accordingly, to implement this query, write an artworks_for_user_id 
#class method in your Artwork model that you can then call from your controller, 
#passing in the specified user's id. (You can access the specified user's id in the 
#controller through params[:user_id] because :user_id is part of the nested route.)

  def self.artworks_for_user_id(id)
    art_work = ArtWork.joins(:artist).where('artist_id = (?)', id).pluck('users.id')
    art_work.first
  end
end
