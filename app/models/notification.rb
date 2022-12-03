class Notification < ApplicationRecord
  enum checked: { uncheck: false, check: true }
  belongs_to :contact
  def self.unchecked_notifications
    Notification.where(checked: false)
  end
end
