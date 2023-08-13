class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :soccer_group, optional: true

  has_many :posts_comments, dependent: :destroy
  has_many :posts_likes, dependent: :destroy
  

end
