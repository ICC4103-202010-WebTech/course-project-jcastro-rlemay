class CreateOrganizationEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_events do |t|
      t.belongs_to :organization
      t.belongs_to :event
      t.timestamps
    end
  end
end
