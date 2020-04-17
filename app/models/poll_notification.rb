class PollNotification < ApplicationRecord
  belongs_to :notification
  belongs_to :poll
  has_one :user, through: :notification
  has_one :event, through: :poll
end
