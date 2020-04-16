class CreateEventPages < ActiveRecord::Migration[6.0]
  def change
    create_table :event_pages do |t|
      t.integer :minimumGuests
      t.integer :maximumGuests
      t.string :bannerPicture
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
