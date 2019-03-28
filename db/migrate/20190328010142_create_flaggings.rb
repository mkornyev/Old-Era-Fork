class CreateFlaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :flaggings do |t|
      t.belongs_to :resource, foreign_key: true
      t.belongs_to :flag, foreign_key: true

      t.timestamps
    end
  end
end
