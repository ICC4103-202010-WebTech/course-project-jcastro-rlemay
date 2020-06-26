class CreateEventReports < ActiveRecord::Migration[6.0]
  def change
    create_table :event_reports do |t|
      t.string :reason
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end
