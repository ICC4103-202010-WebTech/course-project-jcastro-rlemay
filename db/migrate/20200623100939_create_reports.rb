class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :reason
      t.references :reported
      t.references :reporter
      t.timestamps
    end
  end
end