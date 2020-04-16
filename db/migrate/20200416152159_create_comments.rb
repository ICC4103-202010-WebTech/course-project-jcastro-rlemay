class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :image
      t.belongs_to :user, index: true
      t.belongs_to :event_page, index: true

      t.timestamps
    end
  end
end
