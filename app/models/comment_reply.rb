class CommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_one :event, through: comment
end
