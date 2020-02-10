class AddStatusColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :boolean
  end
end
