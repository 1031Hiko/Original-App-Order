class ProductsController < ApplicationController

  # def index
  #   @brand = Brand.find(params[:brand_id])
  #   @products = @brand.products
  #   @posted_products = @products.posted_products

  # end

  def new
    @brand = Brand.find(current_brand.id)
    @product = Product.new
    @sizes = Size.all
    @colors = Color.all
    @product.posted_products.build
  end

  def create
    binding.pry
    @product = Product.create(posted_params)
  end
    # product = Product.create(product_params)

    # params[:product][:color_id].each do |color|
    # product.products_colors.create(color_id: color)
    # end

    # params[:product][:size_id].each do |size|
    # product.products_sizes.create(size_id: size)
    # end
  def edit
    @brand = Brand.find(current_brand.id)
    @product = Product.new
    @sizes = Size.all
    @colors = Color.all
    @product.posted_products.build
  end

  def update
    Product.update(update_params)
  end

  def show
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products
  end



private
  def update_params
    params.require(:product).permit(:style_number, :price, :size, :color, :fabric, :image)
  end

  def posted_params
     params.require(:product).permit(posted_products_attributes: [:brand_id, :style_number, :price, :color, :size, :fabric, :image, :product_id, :color_id, :size_id, :_destroy]).merge(brand_id:params[:brand_id])
  end


end