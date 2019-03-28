class CreateOutreachWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :outreach_workers do |t|
      t.string :organization
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
