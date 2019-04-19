class AddActiveToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :active, :boolean
  end
end
