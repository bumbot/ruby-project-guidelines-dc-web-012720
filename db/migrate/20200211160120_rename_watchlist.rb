class RenameWatchlist < ActiveRecord::Migration[5.0]
  def change
      rename_table :watchlist, :watchlists
  end
end
