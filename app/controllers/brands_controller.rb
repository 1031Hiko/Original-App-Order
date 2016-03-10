class BrandsController < ApplicationController

  def new
    @brand = Brand.new
    @brand.products.build
    @sizes = Size.all
    @colors = Color.all
  end

  def create
    Brand.create(create_params)

  end

  def show
    @brand = Brand.find(params[:id])
  end

  def edit
  end

  def update
    current_brand.update(update_params)
  end

  private
    def update_params
      params.require(:brand).permit(:company_name, :company_address, :country, :user_name, :phone_number, :item_type, :avatar)
    end

    def create_params
      params.require(:brand).permit(products_attributes: [:style_number, :price, :color, :size, :fabric, :image, :_destroy]).merge(brand_id:current_brand.id)
    end
end


