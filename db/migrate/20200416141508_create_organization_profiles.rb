class CreateOrganizationProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_profiles do |t|
      t.text :description
      t.belongs_to :organization, index: true

      t.timestamps
    end
  end
end
