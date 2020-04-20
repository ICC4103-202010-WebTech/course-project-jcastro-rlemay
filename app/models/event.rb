class Event < ApplicationRecord
  has_one :event_page, dependent: :destroy
  before_create :build_event_page
  belongs_to :event_organizer
  has_one :organization
  has_one :poll, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations
  has_many :comments, dependent: :destroy

  before_create :update_stats
  before_update :update_stats
  after_destroy :erase_stats

  private
    def update_stats
      ec = self.event_organizer
      ec.eventsCreated += 1
      ec.save
    end

  private
    def erase_stats
      ecd = self.event_organizer
      ecd.eventsCreated -= 1
      ecd.save
    end

end
