class BrandsController < ApplicationController

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

end


