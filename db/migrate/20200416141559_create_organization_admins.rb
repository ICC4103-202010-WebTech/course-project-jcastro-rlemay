class CreateOrganizationAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_admins do |t|
      t.belongs_to :user, index: true
      t.references :organization

      t.timestamps
    end
  end
end
