class Room < ApplicationRecord
    
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages

  validates :name, presence: true
  
end
