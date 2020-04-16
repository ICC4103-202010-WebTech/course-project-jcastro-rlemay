class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastName
      t.string :password
      t.string :email
      t.string :location
      t.string :address
      t.string :phone
      t.references :organization
      t.references :inbox

      t.timestamps
    end
  end
end
