class EventPage < ApplicationRecord
  belongs_to :event
  has_many :comments, dependent: :destroy
  has_many :comment_replies, through: :comments, dependent: :destroy

  has_one_attached :event_banner_picture
  has_many_attached :event_files
end
