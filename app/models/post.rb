class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :soccer_group, optional: true

  has_many :posts_comments, dependent: :destroy
  has_many :posts_likes, dependent: :destroy
  # 検索方法分岐
  def self.search(search)
    if search != ""
      Post.where('body LIKE(?) OR post_title LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end

end
