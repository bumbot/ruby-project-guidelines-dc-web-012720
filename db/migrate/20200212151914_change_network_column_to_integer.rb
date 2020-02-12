class ChangeNetworkColumnToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :shows, :network, :string
    add_column :shows, :network_id, :integer
  end
end
