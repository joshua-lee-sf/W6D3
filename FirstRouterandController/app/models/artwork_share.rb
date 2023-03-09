# == Schema Information
#
# Table name: artwork_shares
#
#  id          :bigint           not null, primary key
#  art_work_id :bigint           not null
#  viewer_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ArtworkShare < ApplicationRecord

  belongs_to :artwork,
    foreign_key: :art_work_id,
    class_name: :ArtWork

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User
end
