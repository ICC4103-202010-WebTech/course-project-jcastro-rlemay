class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
