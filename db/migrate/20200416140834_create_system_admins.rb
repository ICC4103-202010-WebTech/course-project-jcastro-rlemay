class CreateSystemAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :system_admins do |t|
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
