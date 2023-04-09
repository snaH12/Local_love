class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :post
    validates_uniqueness_of :post_id, scope: :user_id
    #複数のカラムを使ったユニーク制約
end
