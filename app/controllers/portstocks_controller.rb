class PortstocksController < ApplicationController

  # GET /portstocks/new
  # GET /portstocks/new.json
  def new
    @portstock = Portstock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portstock }
    end
  end

  # POST /portstocks
  # POST /portstocks.json
  def create
    @portstock = Portstock.new(params[:portstock])

    respond_to do |format|
      if @portstock.save
        format.html { redirect_to @portstock, notice: 'Portstock was successfully created.' }
        format.json { render json: @portstock, status: :created, location: @portstock }
      else
        format.html { render action: "new" }
        format.json { render json: @portstock.errors, status: :unprocessable_entity }
      end
    end
  end
end
