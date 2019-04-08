class AddAddressToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :street_1, :string
    add_column :resources, :street_2, :string
    add_column :resources, :city, :string
    add_column :resources, :state, :string
    add_column :resources, :zip, :string
  end
end
