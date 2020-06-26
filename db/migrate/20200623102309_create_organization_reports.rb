class CreateOrganizationReports < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_reports do |t|
      t.string :reason
      t.belongs_to :user
      t.belongs_to :organization

      t.timestamps
    end
  end
end
