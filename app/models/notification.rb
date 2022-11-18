class Notification < ApplicationRecord
  belongs_to :contact

  def self.confirmed
    unchecked_notifications = Contact.notifications.where(checked: false)
    unchecked_notifications.each do |un|
      un.update!(checked: true)
    end
  end
end
