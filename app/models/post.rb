class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :soccer_group, optional: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes_customers, through: :likes, source: :customer
  # 検索方法分岐
  def self.search(search)
    if search != ""
      Post.where('body LIKE(?) OR post_title LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end
end
