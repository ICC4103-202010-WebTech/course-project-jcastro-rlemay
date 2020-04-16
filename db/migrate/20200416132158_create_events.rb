class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :location
      t.text :description
      t.boolean :public
      t.belongs_to :event_organizer
      t.references :organization
      t.references :poll

      t.timestamps
    end
  end
end
