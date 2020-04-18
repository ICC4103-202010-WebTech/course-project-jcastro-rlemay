class CreatePollNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_notifications do |t|
      t.belongs_to :notification
      t.belongs_to :poll
      t.timestamps
    end
  end
end
