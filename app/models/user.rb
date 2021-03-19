class User < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy
   has_many :fav_posts, through: :favorites, source: :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  validates :username, presence: true
  attachment :user_image
    
    def already_favorited?(post)
        self.favorites.exists?(post_id: post.id)
    end    

end
