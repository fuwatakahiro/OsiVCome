class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#ゲストユーザーの作成又は見つけ出すためのもの
  def self.guest
    find_or_create_by(email: "admin@exmple.com") do |admin|
      admin.password = SecureRandom.urlsafe_base64
    end
  end
end
