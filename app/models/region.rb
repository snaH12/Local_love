class Region < ApplicationRecord
  has_many :posts
  validates :name, presence:true
end
