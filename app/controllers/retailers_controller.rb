class RetailersController < ApplicationController
  def show
    @retailer = Retailer.find(params[:id])
  end

  def edit
  end

  def update
  end
end
