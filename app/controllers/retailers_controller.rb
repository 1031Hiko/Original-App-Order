class RetailersController < ApplicationController
  def index
   @products = Product.all
  end

  def show
    @retailer = Retailer.find(params[:id])
  end

  # def new
  #   @product = Product.find(params[:id])

  #   @retailer = Retailer.new
  #   @retailer.product_id = @product.id
  # end

  # def create
  #   Contract.create(order_params)
  # end

  def edit
  end

  def update
    current_retailer.update(update_params)
  end

  private

  # def order_params
  #   params.require(:product).permit(:style_number, :price, :color, :size, :fabric, :image)
  # end

  def update_params
    params.require(:retailer).permit(:company_name, :company_address, :country, :user_name, :phone_number, :item_type, :avatar)
  end
end
