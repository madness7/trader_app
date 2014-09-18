class PortstocksController < ApplicationController
  before_filter :create_values_for_new_transaction, only: :new

  # GET /portstocks/new
  # GET /portstocks/new.json
  require 'yahoo_finance'
  def new   
    @portstock = Portstock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portstock }
    end
  end
  # No show page to be redirected to. Needs to go to the show page for the portfolio into which the shares have been added.
  # POST /portstocks
  # POST /portstocks.json
  def create
    @portstock = Portstock.new(params[:portstock])
    # subtract cost of stock from portfolio blanace

    @portfolio = @portstock.portfolio
    @portfolio.balance = @portfolio.balance - (@portstock.price_paid * @portstock.quantity)
    respond_to do |format|
      if @portstock.save
        @portfolio.save
        format.html { redirect_to @portfolio}
        format.json { render json: @portstock, status: :created, location: @portstock }
      else
        create_values_for_new_transaction
        format.html { render action: "new" }
        format.json { render json: @portstock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portstocks/1
  # DELETE /portstocks/1.json
  def destroy
    @portstock = Portstock.find(params[:id])
    @portfolio = @portstock.portfolio
    @portfolio.balance = @portfolio.balance + (@portstock.price_paid * @portstock.quantity)
    @portfolio.save
    @portstock.destroy
    

    respond_to do |format|
      format.html { redirect_to @portfolio }
      format.json { head :no_content }
    end
  end


  def create_values_for_new_transaction
    if params[:symbol]
      @current_price = Stock.find_by_symbol(params[:symbol]).current_price
    else
      @current_price = Stock.find_by_symbol(params[:portstock][:stock_id]).current_price
    end  
    @portfolios = current_user.portfolios
  end
  
end
