class CreateShowgenreTable < ActiveRecord::Migration[5.0]
  def change
    create_table :show_genres do |t|
      t.integer :show_id
      t.integer :genre_id
    end
  end
end
