class CreateUtv < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlist do |t|
      t.integer :user_id
      t.integer :show_id
    end
  end
end
