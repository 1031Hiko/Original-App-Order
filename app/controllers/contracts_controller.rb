class ContractsController < ApplicationController

  def new
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products
    @contract = Contract.new
    @contract.sold_products.build
  end

  def create
    @contract = Contract.create(order_params)

      redirect_to brand_contract_path(params[:brand_id], @contract)
  end

  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do

      pdf = ContractPDF.new(@contract)

        # 画面にPDFを表示する
        # disposition: "inline" によりPDFはダウンロードではなく画面に表示される
        send_data pdf.render,
          filename:    "#{@contract.id}.pdf",
          type:        "application/pdf",
          disposition: "inline"
      end
    end
  end


  private
    def order_params
       params.require(:contract).permit(sold_products_attributes: [:product_id, :color_id, :size_id, :contract_id, :quantity, :price, :_destroy]).merge(retailer_id:current_retailer.id, brand_id:params[:brand_id])
    end

end
