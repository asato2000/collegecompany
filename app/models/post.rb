class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :fav_posts, through: :favorites, source: :user
    
    validates :title,:content,:teacher_name,:subject, presence: true
     attachment :post_image
     
    
end
