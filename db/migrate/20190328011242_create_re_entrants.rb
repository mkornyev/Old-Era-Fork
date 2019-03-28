class CreateReEntrants < ActiveRecord::Migration[5.2]
  def change
    create_table :re_entrants do |t|
      t.string :neighborhood
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
