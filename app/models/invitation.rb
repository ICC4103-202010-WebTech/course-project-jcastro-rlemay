class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :event_organizer, through: :event

  validates :user_id, uniqueness: { scope: :event_id}
end
