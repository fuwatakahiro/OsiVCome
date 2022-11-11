class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :character
  has_many :favorites, dependent: :destroy
  validates :content, presence: true
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
