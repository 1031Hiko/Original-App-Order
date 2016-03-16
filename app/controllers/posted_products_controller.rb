class PostedProductsController < ApplicationController

  def create
    @product = PostedProduct.create(product_params)
    redirect_to :root
  end

  def edit
    @product = PostedProduct.find(params[:id])
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to new_brand_product_path, notice: "#{@product.name} updated。"
    else
      render :edit
    end
  end

private
  def product_params
     params.require(:posted_product).permit(products_attributes: [:brand_id, :style_number, :price, :color, :size, :fabric, :image, :product_id, :color_id, :size_id, :_destroy])
  end

end

