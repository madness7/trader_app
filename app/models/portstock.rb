class Portstock < ActiveRecord::Base
  attr_accessible :portfolio_id, :price_paid, :quantity, :stock_id

  belongs_to :portfolio
  belongs_to :stock
end
