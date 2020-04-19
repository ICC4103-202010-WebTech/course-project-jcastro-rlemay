class Notification < ApplicationRecord
  belongs_to :user
  has_one :poll_notification, dependent: :destroy #the notification can be a poll notification itself
end
