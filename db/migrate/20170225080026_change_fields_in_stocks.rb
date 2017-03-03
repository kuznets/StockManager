class ChangeFieldsInStocks < ActiveRecord::Migration[5.0]
  def change
  	change_column :stocks, :name, :string, null: false
  	change_column :stocks, :unit_price, :decimal, precision: 9, scale: 2, null: false
  	change_column :stocks, :interest, :decimal, precision: 3, scale: 2, null: false
  	change_column :stocks, :duration, :integer, limit: 3, null: false
  end
end
