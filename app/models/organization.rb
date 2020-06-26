class Organization < ApplicationRecord
  has_one :organization_profile, dependent: :destroy
  before_create :build_organization_profile
  has_many :organization_admins, dependent: :destroy
  has_many :organization_members, dependent: :destroy
  has_many :users, through: :organization_members
  has_many :organization_events, dependent: :destroy
  has_many :org_events, class_name: "Event", foreign_key: "id", source: :event, through: :organization_events, dependent: :destroy
  has_many :events, through: :organization_members
  has_many :organization_reports, dependent: :destroy
  accepts_nested_attributes_for :organization_profile
end
