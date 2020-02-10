class AddRuntimeColumnToShows < ActiveRecord::Migration[5.0]
  def change
    add_column :shows, :runtime, :integer
  end
end
