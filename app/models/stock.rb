class Stock < ActiveRecord::Base
  attr_accessible :name, :portfolio_id, :price, :symbol, :user_id

has_many :portfolios, through: :portstock
has_many :portstocks

  
end
