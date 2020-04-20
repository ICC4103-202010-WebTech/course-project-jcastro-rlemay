class Organization < ApplicationRecord
  has_one :organization_profile, dependent: :destroy
  before_create :build_organization_profile
  has_many :organization_admins
  has_many :organization_members
  has_many :users, through: :organization_members
  has_many :organization_events, dependent: :destroy
  has_many :events, through: :organization_events, dependent: :destroy

end
