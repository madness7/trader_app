class PortfoliosController < ApplicationController

  before_filter :authenticate_user!

  def new
    @portfolio = Portfolio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portfolio }
    end
  end

 def create
   @portfolio = Portfolio.new(params[:portfolio])
   @portfolio.user_id = current_user.id


   respond_to do |format|
     if @portfolio.save
       format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
       format.json { render json: @portfolio, status: :created, location: @portfolio }
     else
       format.html { render action: "new" }
       format.json { render json: @portfolio.errors, status: :unprocessable_entity }
     end
   end
 end

  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio = Portfolio.find(params[:id])
  end

    # DELETE /portfolios/1
    # DELETE /portfolios/1.json
    def destroy
      @portfolio = Portfolio.find(params[:id])
      @portfolio.destroy

      respond_to do |format|
        format.html { redirect_to portfolios_url }
        format.json { head :no_content }
      end
    end

 def index
    @portfolios = current_user.portfolios
    # binding.pry

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @portfolios }
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @portstocks = @portfolio.portstocks

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @portfolio }
    end
  end
end
# @portfolios = current_user.portfolios 