class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :event_organizer, through: :event
  after_create :create_notification

  def create_notification
    x = Notification.create(message: "You have been invited to an event", user_id: self.user_id)
    x.save!
  end
end
