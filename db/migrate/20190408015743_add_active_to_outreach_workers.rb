class AddActiveToOutreachWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :outreach_workers, :active, :boolean
  end
end
