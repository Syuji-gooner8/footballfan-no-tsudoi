class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, through: :posts, dependent: :destroy
  has_many :joined_soccer_groups, through: :posts, source: :soccergroup

  validates :phone_number, presence: true, numericality: {only_integer: true}


  VALID_POST_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
  validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }



  def already_joined?(soccergroup)
    self.posts.exists?(soccergroup_id: soccergroup.id)
  end
  has_many :likes, dependent: :destroy
  has_many liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy

  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestcustomer"
      customer.phone_number = "1234567"
      customer.post_code = "1234567"
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
