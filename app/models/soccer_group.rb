class SoccerGroup < ApplicationRecord
  has_many :posts
  has_many :customers, through: :posts
  has_many :joined_customers, through: :posts, source: :customer

  def already_joining?(customer)
    self.posts.exists?(customer_id: customer.id)
  end
  
  def self.search(search)
    if search != ""
      SoccerGroup.where('name LIKE(?) ', "%#{search}%")
    else
      SoccerGroup.all
    end
  end
end
