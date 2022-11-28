class Comment < ApplicationRecord
  belongs_to :customer, counter_cache: true
  belongs_to :character, counter_cache: true
  has_many :favorites, dependent: :destroy
  validates :content, presence: true
  #コメントに対していいねがあるかないかを確認
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
