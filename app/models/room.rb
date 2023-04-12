class Room < ApplicationRecord
    
    has_many :messages
    has_many :room_users, dependent: :destroy
    has_many :users, through: :room_users, source: :user
end
