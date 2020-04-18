class CreateEventOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_organizers do |t|
      t.integer :eventsCreated, default: 0
      t.belongs_to :user,index: true

      t.timestamps
    end
  end
end
