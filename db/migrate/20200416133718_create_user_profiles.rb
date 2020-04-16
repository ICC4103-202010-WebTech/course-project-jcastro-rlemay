class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :userName
      t.text :bio
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
