class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name,presence: true
  validates :email, presence: true
  validates :introduction, length: { maximum: 50 }
  has_one_attached :profile_image

  def active_for_authentication?
    super && !is_deleted
  end
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end

  def self.guest
    find_or_create_by(email: "guest@gmail.com") do |customer|
      customer.name = "ゲストユーザー"
      customer.password = SecureRandom.urlsafe_base64
    end
  end
  def self.search_for(content)
    Customer.where("name LIKE?", "%"+content+"%")
  end
end
