class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  has_one :event, through: :poll

  validates :user_id, uniqueness: { scope: :poll_id}
end
