class Region < ApplicationRecord
  has_one_attached :image
  
  has_many :posts, dependent: :destroy
  validates :name, presence:true
end
