class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :unit_price, precision: 9, scale: 2
      t.integer :interest, limit: 3
      t.date :duration

      t.timestamps
    end
  end
end
