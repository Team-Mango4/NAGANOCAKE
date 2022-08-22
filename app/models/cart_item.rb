class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  #カート内の小計を求めるため
  def subtotal
    item.with_tax_price * amount
  end

end
