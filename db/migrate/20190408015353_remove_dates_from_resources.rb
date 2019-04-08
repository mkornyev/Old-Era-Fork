class RemoveDatesFromResources < ActiveRecord::Migration[5.2]
  def change
    remove_column :resources, :startDate, :datetime
    remove_column :resources, :endDate, :datetime
  end
end
