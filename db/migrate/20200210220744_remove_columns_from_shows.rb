class RemoveColumnsFromShows < ActiveRecord::Migration[5.0]
  def change
    remove_columns :shows, :actors
    remove_columns :shows, :directors
    remove_columns :shows, :start_date
    remove_columns :shows, :end_date
  end
end
