class Tag < ApplicationRecord
    has_many :post_tags,dependent: :destroy, foreign_key: 'tag_id'
    has_many :posts,through: :post_tags
    
    validates :name, uniqueness: true, presence: true
    def post_tags_count
        post_tags.includes(:post).where(post: { status:  :published }).size
    end
end
