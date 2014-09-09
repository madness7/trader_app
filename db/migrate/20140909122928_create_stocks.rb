class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :portfolio_id
      t.integer :user_id
      t.string :name
      t.string :symbol
      t.float :price

      t.timestamps
    end
  end
end
