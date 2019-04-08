class AddBookmarksToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :bookmarked, :boolean
  end
end
