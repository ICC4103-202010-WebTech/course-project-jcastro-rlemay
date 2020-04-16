class Organization < ApplicationRecord
  has_one :organization_profile
  before_create :build_organization_profile
  has_many :organization_admins
  has_many :users
end
