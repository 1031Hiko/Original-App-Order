class OrderForsController < ApplicationController

  def index
    @orders = OrderFor.all
  end

  def new
    @order = OrderFor.new
    @order.sold_products.build
    @register = Register.find(params[:register_id])
    @products = @register.products
    @retailer = Retailer.find(params[:retailer_id])
    @sizes = Size.all
    @colors = Color.all
  end

  def create
    @order = OrderFor.create(order_params)
    redirect_to order_for_path(@order)
  end

  def show
    @order = OrderFor.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do

      pdf = OrderForPDF.new(@order)

        # 画面にPDFを表示する
        # disposition: "inline" によりPDFはダウンロードではなく画面に表示される
        send_data pdf.render,
          filename:    "#{@order.id}.pdf",
          type:        "application/pdf",
          disposition: "inline"
      end
    end
  end

  def edit
    @order = OrderFor.find(params[:id])
    @products = @order.products
    @sizes = Size.all
    @colors = Color.all
    @retailer = Retailer.find(current_retailer.id)
  end

  def update
    @order = OrderFor.find(params[:id])
    @order.update(order_params)
    redirect_to :root
  end

  private
    def order_params
       params.require(:order_for).permit(sold_products_attributes: [:id, :product_id, :color_id, :size_id, :contract_id, :quantity, :price, :_destroy]).merge(retailer_id:current_retailer.id, brand_id:params[:brand_id])
    end

end
