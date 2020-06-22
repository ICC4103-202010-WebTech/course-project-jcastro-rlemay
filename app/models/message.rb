class Message < ApplicationRecord
  belongs_to :from, :class_name => 'User', :foreign_key => 'from'
  belongs_to :to, :class_name => 'User', :foreign_key => 'to'
end
