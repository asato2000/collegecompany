class Post < ApplicationRecord
    belongs_to :user
    belongs_to :seller, class_name: "User", foreign_key: "seller_id"
    belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
    has_one :post
    has_many :favorites, dependent: :destroy
    has_many :fav_posts, through: :favorites, source: :user
    
    mount_uploader :note, NoteUploader
    
    
    validates :title,:content,:teacher_name,:subject,:price,:note, presence: true
     attachment :post_image
     
    
end
