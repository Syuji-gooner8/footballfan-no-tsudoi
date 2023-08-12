class Post < ApplicationRecord
  has_one_attached :post_image_url
  belongs_to :customer
  belongs_to :soccer_group, optional: true

  has_many :posts_comments, dependent: :destroy
  has_many :posts_likes, dependent: :destroy
  

end
