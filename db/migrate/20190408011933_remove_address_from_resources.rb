class RemoveAddressFromResources < ActiveRecord::Migration[5.2]
  def change
    remove_column :resources, :address, :string
  end
end
