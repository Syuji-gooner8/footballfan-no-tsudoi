class SoccerGroup < ApplicationRecord
  has_many :posts
  has_many :customers, through: :posts
  has_many :joined_customers, through: :posts, source: :customer

  def already_joining?(customer)
    self.posts.exists?(customer_id: customer.id)
  end
end
