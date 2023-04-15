class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :region
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :title, length: { minimum: 2, maximum: 20 }
  validates :body, length: {maximum:200}
  
  enum status: { published: 0, draft: 1 }
  
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-icon.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
