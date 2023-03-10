class Like < ApplicationRecord
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :art_work,
        foreign_key: :art_work_id,
        class_name: :ArtWork

    def self.user_like_finder(id)
        Like.joins(:art_work).left_outer_joins(:user).where('user_id = (?)', id).select('art_works.id, art_works.title')
    end
    
    def self.art_work_like_finder(id)
        Like.joins(:art_work).where('art_work_id = (?)', id).select('art_works.id, art_works.title')
    end
end