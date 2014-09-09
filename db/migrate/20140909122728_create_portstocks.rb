class CreatePortstocks < ActiveRecord::Migration
  def change
    create_table :portstocks do |t|
      t.integer :portfolio_id
      t.integer :stock_id
      t.integer :quantity
      t.float :price_paid

      t.timestamps
    end
  end
end
