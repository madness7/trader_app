class Stock < ActiveRecord::Base
  attr_accessible :name, :portfolio_id, :price, :symbol, :user_id

  has_many :portstocks
has_many :portfolios, through: :portstocks


  
end
