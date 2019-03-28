class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.datetime :startDate
      t.datetime :endDate
      t.string :phone
      t.string :email
      t.string :address
      t.string :image
      t.string :desc
      t.string :webpage

      t.timestamps
    end
  end
end
