class CreateShowTable < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :actors
      t.string :directors
      t.text :plot
      t.float :rating
      t.string :genre
      t.string :network
      t.date :start_date
      t.date :end_date
    end
  end
end
