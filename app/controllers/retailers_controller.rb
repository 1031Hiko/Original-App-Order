class RetailersController < ApplicationController

  def show
    @retailer = Retailer.find(params[:id])
  end

  def edit
  end

  def update
    current_retailer.update(update_params)
  end

  private
  def update_params
    params.require(:retailer).permit(:company_name, :company_address, :country, :user_name, :phone_number, :item_type, :avatar)
  end

end
