class CreateOrganizationMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_members do |t|
      t.belongs_to :user
      t.belongs_to :organization
      t.timestamps
    end
  end
end
