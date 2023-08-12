class SoccerGroup < ApplicationRecord
  belongs_to :customer
  has_many :posts, dependent: :destroy
end
