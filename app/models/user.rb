class User < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


 
   
    
    def already_favorited?(post)
        self.favorites.exists?(post_id: post.id)
    end    
    
    


end
