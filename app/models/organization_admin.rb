class OrganizationAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :organization, dependent: :destroy

end
