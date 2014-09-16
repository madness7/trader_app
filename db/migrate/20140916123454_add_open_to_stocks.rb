class AddOpenToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :open, :float
    add_column :stocks, :date, :string
  end
end
