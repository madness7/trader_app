class Stock < ActiveRecord::Base
  attr_accessible :name, :portfolio_id, :price, :symbol, :user_id
  has_many :portstocks
  # require 'yahoo_finance'

  has_many :portfolios, through: :portstocks
  

  def current_price
    data = YahooFinance.quotes([symbol], [:bid])
    data[0].bid
  end
end
