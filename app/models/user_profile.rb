class UserProfile < ApplicationRecord
  belongs_to :user
  validates :userName, :uniqueness => true
end
