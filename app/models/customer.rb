class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image_url
  has_many :posts, dependent: :destroy
  has_many :soccerteams, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def active_for_authentication?
    super && (is_withdrawal == false)
  end

  def customer_status
    if is_withdrawal == true
      "退会"
    else
      "有効"
    end
  end


end
