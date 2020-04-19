class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event_page
  has_one :event, through: :event_page
  has_many :comment_replies, dependent: :destroy
end
