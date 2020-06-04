class Event < ApplicationRecord
  has_one :event_page, dependent: :destroy
  before_create :build_event_page
  belongs_to :event_organizer
  has_one :organization
  has_one :poll, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations
  has_one :organization_event, dependent: :destroy
  accepts_nested_attributes_for :poll
  #has_many :comments, through: :event_page, dependent: :destroy

  before_create :update_stats
  before_update :update_stats
  after_destroy :erase_stats

  validate :start_date_past
  validate :end_date_past

  def start_date_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_past
    if end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be in the past")
    end
  end

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
