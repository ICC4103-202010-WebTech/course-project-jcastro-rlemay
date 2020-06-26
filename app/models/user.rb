class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_one :user_profile, dependent: :destroy
  before_create :build_user_profile
  has_one :inbox, dependent: :destroy
  before_create :build_inbox
  has_one :organization_member, dependent: :destroy #he can be an organization member himself
  has_one :organization, through: :organization_member
  has_many :notifications, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :events, through: :invitations
  has_many :reports_received, class_name: "Report", :foreign_key => 'reported_id', dependent: :destroy
  has_many :reports_made, class_name: "Report", :foreign_key => 'reporter_id', dependent: :destroy
  has_many :event_reports, dependent: :destroy
  has_many :organization_reports, dependent: :destroy
  validates :email, uniqueness: true, format: {
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: 'invalid email'
  }
  has_many :comments, dependent: :destroy
  has_many :comment_replies, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_one :event_organizer, dependent: :destroy #he can be an event organizer himself
  has_one :organization_admin, dependent: :destroy #he can be an organization admin himself

  def self.from_google(email:, first_name:, last_name:)
    create_with(name: first_name, lastName: last_name,
                password: "123456").find_or_create_by!(email: email)
  end

end
