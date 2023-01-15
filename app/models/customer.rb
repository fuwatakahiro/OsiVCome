class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :contacts,dependent: :destroy
  has_many :customer_groups, dependent: :destroy
  has_one :group, through: :customer_groups

  validates :name,presence: true
  validates :email, presence: true
  validates :introduction, length: { maximum: 50 }
  has_one_attached :profile_image
  #deveise側のメソッドでログインしていいのかを判断する
  def active_for_authentication?
    super && !is_deleted
  end
  #使用者の画像の大きさ
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
  #ゲストログイン
  def self.guest
    find_or_create_by(email: "guest@gmail.com") do |customer|
      customer.name = "ゲストユーザー"
      customer.password = SecureRandom.urlsafe_base64
    end
  end
  #使用者側を探す
  def self.search_for(content)
    Customer.where("name LIKE?", "%"+content+"%")
  end
  #フォローをする
  def follower(customer)
    relationships.create(followed_id: customer.id)
  end
  #フォローを外す
  def unfollower(customer)
    relationships.find_by(followed_id: customer.id).destroy
  end
  
  def following?(customer)
    followings.include?(customer)
  end
end
