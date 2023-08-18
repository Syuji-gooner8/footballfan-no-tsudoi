class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, through: :posts, dependent: :destroy
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
  
  def get_profile_image(width, height)
   unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   image.variant(resize_to_limit: [width, height]).processed
  end
end
