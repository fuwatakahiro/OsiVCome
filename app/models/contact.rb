class Contact < ApplicationRecord
  has_many :notifications,dependent: :destroy
  validates :name, presence: true
  validates :message,presence: true
end
