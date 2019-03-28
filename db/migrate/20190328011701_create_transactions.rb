class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.belongs_to :outreachWorker, foreign_key: true
      t.belongs_to :reEntrant, foreign_key: true
      t.belongs_to :resource, foreign_key: true
      t.boolean :resourceAccessed
      t.datetime :dateAccessed

      t.timestamps
    end
  end
end
