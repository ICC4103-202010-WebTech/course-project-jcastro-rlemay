class Poll < ApplicationRecord
  belongs_to :event
  has_many :votes, dependent: :destroy
  has_many :poll_notifications, dependent: :destroy
end
