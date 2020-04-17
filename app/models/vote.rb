class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  has_one :event, through: :poll
end
