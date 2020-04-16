class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  before_create :build_user_profile
  has_one :inbox, dependent: :destroy
  before_create :build_inbox
  has_one :organization
  has_many :notifications
  has_many :invitations
  has_many :events, through: :invitations
end
