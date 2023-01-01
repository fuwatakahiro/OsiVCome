class Group < ApplicationRecord
  has_many :customer_groups, dependent: :destroy
  has_many :customers, through: :customer_groups
  belongs_to :character
end
