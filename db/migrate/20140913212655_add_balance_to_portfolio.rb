class AddBalanceToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :balance, :float
    add_index :portfolios, :user_id
  end
end
