class SoldProduct < ActiveRecord::Base
  validates :quantity,
             presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :contract
  belongs_to :product
  belongs_to :color
  belongs_to :size
  belongs_to :retailer

  def total_price
    price * quantity
  end

end