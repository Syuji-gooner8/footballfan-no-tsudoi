class Post < ApplicationRecord
  has_one_attached :post_image_url
  belongs_to :customer
  belongs_to :team

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
    # タグのリレーションのみ記載
  has_many :post_tags,dependent: :destroy
  has_many :tags,through: :post_tags


end
