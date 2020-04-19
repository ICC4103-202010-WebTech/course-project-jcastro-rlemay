class Event < ApplicationRecord
  has_one :event_page, dependent: :destroy
  before_create :build_event_page
  belongs_to :event_organizer
  has_one :organization
  has_one :poll, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations
  has_many :comments, dependent: :destroy

end
