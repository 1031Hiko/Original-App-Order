class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @brand = Brand.find(current_brand.id)
    @product = Product.new
    @sizes = Size.all
    @colors = Color.all
  end

  def create
    product = Product.create(product_params)
    
    params[:product][:color_id].each do |color|
    product.products_colors.create(color_id: color)
    end

    params[:product][:size_id].each do |size|
    product.products_sizes.create(size_id: size)
    end
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
