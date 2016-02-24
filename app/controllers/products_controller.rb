class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.permit(:style_number, :price, :color, :size, :fabric)
  end

  def edit
  end


end
