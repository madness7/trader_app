class Portstock < ActiveRecord::Base
  attr_accessible :portfolio_id, :price_paid, :quantity, :stock_id

  belongs_to :portfolio
  belongs_to :stock

  validate :portfolio_balance_is_positive_after_transaction

  def portfolio_balance_is_positive_after_transaction
    total_price = quantity * price_paid
    errors.add( :base, "Transactionn cannot be processed , insufficient funds for portfolio.") unless portfolio.balance - total_price >= 0
  end
end
