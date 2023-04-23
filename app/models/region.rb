class Region < ApplicationRecord
  has_one_attached :image
  
  has_many :posts, dependent: :destroy
  validates :name, presence:true
  
  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
  
end
