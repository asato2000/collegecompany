class Post < ApplicationRecord
    belongs_to :user
    has_one :post
    has_many :favorites, dependent: :destroy
    has_many :fav_posts, through: :favorites, source: :user
    mount_uploader :note, NoteUploader
    
    
    validates :title,:content,:teacher_name,:subject, presence: true
     attachment :post_image
     
    
end
