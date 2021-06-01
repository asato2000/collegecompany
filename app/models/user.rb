class User < ApplicationRecord
  has_many :posts
  has_many :sold_items, class_name: 'Post', foreign_key: 'seller_id'
  has_many :bought_items, class_name: 'Post', foreign_key: 'buyer_id'

  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :post
  has_one :card, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  validates :username, :user_image, presence: true
  attachment :user_image
    
    def already_favorited?(post)
        self.favorites.exists?(post_id: post.id)
    end    

end
