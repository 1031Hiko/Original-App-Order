class ProductsController < ApplicationController

  def new
    @form = PostedProduct.new
    @form.products.build
    @brand = Brand.find(current_brand.id)
    @product = Product.new
    @sizes = Size.all
    @colors = Color.all
  end

  def create
    @product = PostedProduct.create(product_params)
    redirect_to :root
  end
  # def edit
  #   @form = PostedProduct.new
  #   @form.products.build
  #   @brand = Brand.find(current_brand.id)
  #   # @product = Product.all
  #   @products = @brand.products
  #   @sizes = Size.all
  #   @colors = Color.all
  # end
  def edit
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products
    @forms = PostedProduct.find(@products[0][:posted_product_id])
    @form = @forms.products
    @forms.products.build
    @sizes = Size.all
    @colors = Color.all

  end

  def update
    if @product.update_attributes(product_params)
      redirect_to new_brand_product_path, notice: "#{@product.name} updated。"
    else
      render :edit
    end
  end

  def show
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products
  end

private
  def update_params
    params.require(:product).permit(:style_number, :price, :size, :color, :fabric, :image)
  end

  def product_params
     params.require(:posted_product).permit(products_attributes: [:brand_id, :style_number, :price, :color, :size, :fabric, :image, :product_id, :color_id, :size_id, :_destroy]).merge(brand_id:params[:brand_id])
  end

end