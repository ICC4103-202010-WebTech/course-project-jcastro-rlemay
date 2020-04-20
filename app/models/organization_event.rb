class OrganizationEvent < ApplicationRecord
  belongs_to :organization
  belongs_to :event, dependent: :destroy
end
