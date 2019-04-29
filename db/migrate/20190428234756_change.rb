class Change < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions, :resourceAccessed, :resource_accessed
  end
end
