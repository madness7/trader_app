class Portfolio < ActiveRecord::Base
  attr_accessible :name, :user_id, :balance

  belongs_to :user 
  
  has_many :portstocks
  has_many :stocks, through: :portstocks
  
end
