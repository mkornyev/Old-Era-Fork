class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.belongs_to :outreach_worker, foreign_key: true
      t.belongs_to :re_entrant, foreign_key: true
      t.belongs_to :resource, foreign_key: true
      t.boolean :resourceAccessed
      t.datetime :dateAccessed

      t.timestamps
    end
  end
end
