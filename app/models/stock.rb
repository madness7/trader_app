class Stock < ActiveRecord::Base
  attr_accessible :name, :portfolio_id, :price, :symbol, :user_id

  
end
