class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :comments, dependent: :destroy
  #has_many :favorites, dependent: :destroy
  validates :name,presence: true
  validates :email, presence: true
  def self.guest
    find_or_create_by(email: "guest@gmail.com") do |customer|
      customer.name = "ゲストユーザー"
      customer.password = SecureRandom.urlsafe_base64
    end
  end
end
