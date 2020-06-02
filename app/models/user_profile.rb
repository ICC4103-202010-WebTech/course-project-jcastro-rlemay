class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture
end
