class TopController < ApplicationController

  before_action :move_to_content_page

  def index
    @brands = Brand.all
    @retailers = Retailer.all
  end

  def move_to_content_page
      redirect_to contents_url unless retailer_signed_in? || buyer_signed_in?
  end
end
