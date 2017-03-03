class ChangeStockNumericFields < ActiveRecord::Migration[5.0]
  def change
  	change_column :stocks, :unit_price, :integer, null: false
  	change_column :stocks, :interest, :integer, limit: 3, null: false
  end
end
