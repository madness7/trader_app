class Portfolio < ActiveRecord::Base
  attr_accessible :name, :user_id, :balance

  belongs_to :user 
  has_many :stocks, through: :portstock
  
end
