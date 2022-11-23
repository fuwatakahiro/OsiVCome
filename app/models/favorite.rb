class Favorite < ApplicationRecord
  belongs_to :comment, counter_cache: true
  belongs_to :customer
end
