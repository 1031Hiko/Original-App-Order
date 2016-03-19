class RegistersController < ApplicationController

  def index
    @registers = Register.all
  end

  def new
    @register = Register.new
    @register.products.build
    @brand = Brand.find(current_brand.id)
    @sizes = Size.all
    @colors = Color.all
  end

  def create
    @register = Register.create(product_params)
    redirect_to :root
  end

  def show
    @register = Register.find(params[:id])
    @products = @register.products
  end

  def edit
    @register = Register.find(params[:id])
    @products = @register.products
    @sizes = Size.all
    @colors = Color.all
    @brand = Brand.find(current_brand.id)
  end

  def update
    @register = Register.find(params[:id])
    @register.update(product_params)
    redirect_to :root
  end

  private
   def product_params
    params.require(:register).permit(:confirmation_expired_date, :delivery_term, :payment_term, :freight_company, :transport_type, :ship_type, products_attributes: [:id, :brand_id, :style_number, :price, :color, :size, :fabric, :image, :product_id, :color_id, :size_id, :_destroy]).merge(brand_id:params[:brand_id])
   end

end
