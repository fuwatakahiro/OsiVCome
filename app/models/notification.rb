class Notification < ApplicationRecord
  belongs_to :contact
  def self.unchecked_notifications
    Notification.where(checked: false)
  end
end
