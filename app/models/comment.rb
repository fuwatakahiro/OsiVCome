class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :character
  validates :content, presence: true
end
