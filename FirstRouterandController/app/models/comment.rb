class Comment < ApplicationRecord
    belongs_to :art_work,
        foreign_key: :art_work_id,
        class_name: :ArtWork

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User


    def self.comment_finder(id)
        Comment.where('art_work_id = (?)', id).select(:body, :id)
    end

    def self.art_work_comment_finder(id)
        Comment.where('author_id = (?)', id).select(:body, :id)
    end
end
