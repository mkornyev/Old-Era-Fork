class AddActiveToReEntrants < ActiveRecord::Migration[5.2]
  def change
    add_column :re_entrants, :active, :boolean
  end
end
