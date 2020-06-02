class OrganizationProfile < ApplicationRecord
  belongs_to :organization
  has_one_attached :banner_picture
end
