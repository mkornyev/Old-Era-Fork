class Active < ActiveRecord::Migration[5.2]
  def change
    change_column :resources, :active, :boolean, default: true
    change_column :users, :active, :boolean, default: true
    change_column :outreach_workers, :active, :boolean, default: true
    change_column :re_entrants, :active, :boolean, default: true
  end
end
