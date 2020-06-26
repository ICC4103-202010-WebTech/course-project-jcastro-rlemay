class EventOrganizer < ApplicationRecord
  belongs_to :user
  has_one :organization, through: :user
  has_many :events, dependent: :destroy
  has_many :invitations, through: :events, dependent: :destroy

end
