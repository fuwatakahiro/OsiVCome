class Contact < ApplicationRecord
  has_many :notifications,dependent: :destroy
  belongs_to :customer
  validates :title, presence: true
  validates :message,presence: true
end
