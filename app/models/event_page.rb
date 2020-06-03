class EventPage < ApplicationRecord
  belongs_to :event
  has_many :comments, dependent: :destroy
  has_many :comment_replies, through: :comments, dependent: :destroy

  has_one_attached :event_banner_picture
  has_many_attached :videos
  validates :videos, blob:{content_type: :video}
  has_many_attached :photos
  validates :photos, blob:{content_type: :image}
  has_many_attached :files
  validates :files, blob:{content_type: ["application/pdf"]}
end
