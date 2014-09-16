class PortstocksController < ApplicationController

  # GET /portstocks/new
  # GET /portstocks/new.json
  def new
    @portstock = Portstock.new
    @portfolios = current_user.portfolios

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
end
