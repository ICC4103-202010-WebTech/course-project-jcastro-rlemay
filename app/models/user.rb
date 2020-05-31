class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  after_create :build_user_profile
  has_one :inbox, dependent: :destroy
  before_create :build_inbox
  has_one :organization_member
  has_one :organization, through: :organization_member
  has_many :notifications, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :events, through: :invitations
  validates :email, uniqueness: true, format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: 'invalid email'
  }
  has_many :comments, dependent: :destroy
  has_many :comment_replies, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_one :event_organizer, dependent: :destroy #he can be an event organizer admin himself
  has_one :organization_admin, dependent: :destroy #he can be an organization admin himself
  has_one :system_admin, dependent: :destroy

end
