class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :to
      t.integer :from
      t.timestamps
    end
  end
end
