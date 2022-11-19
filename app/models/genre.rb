class Genre < ApplicationRecord
  has_many :characters, dependent: :destroy
end
