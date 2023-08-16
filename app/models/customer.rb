class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, through: :posts
  has_many :joined_soccer_groups, through: :posts, source: :soccergroup
  def already_joined?(soccergroup)
    self.posts.exists?(soccergroup_id: soccergroup.id)
  end
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestcustomer"
    end
  end


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
