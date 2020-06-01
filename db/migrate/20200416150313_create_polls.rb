class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.text :possibleDates
      t.integer :minimumAnswers
      t.integer :currentAnswers, default: 0
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
