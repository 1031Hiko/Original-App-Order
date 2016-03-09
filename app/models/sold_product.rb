class SoldProduct < ActiveRecord::Base
  belongs_to :contract
  belongs_to :product
  belongs_to :color
  belongs_to :size

  def total_price
    price * quantity
  end

end