class BrandsController < ApplicationController

  def show
    @brand = Brand.find(params[:id])
  end

  def edit
  end

  def update
  end

end

