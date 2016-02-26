class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @brand = Brand.find(current_brand.id)
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  def edit
   @product = Product.find(params[:id])
   @brand = Brand.find(current_brand.id)
  end

  def update
    Product.update(update_params)
  end

 private
  def product_params
    params.require(:product).permit(:style_number, :price, :color, :size, :fabric, :image).merge(brand_id:current_brand.id)
  end
 
  def update_params
    params.require(:product).permit(:style_number, :price, :size, :color, :fabric, :image)
  end


end
