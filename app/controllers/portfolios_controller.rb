class PortfoliosController < ApplicationController

  before_filter :authenticate_user!
  
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @portfolios = Portfolio.all
  end

  def show
  end
end
