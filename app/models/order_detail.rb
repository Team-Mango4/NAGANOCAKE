class OrderDetail < ApplicationRecord
  enum making_status: { bf_making: 0, waiting_for_making: 1, making: 2, done: 3 }
  belongs_to :order
  belongs_to :item

  # order_statusが入金済み（1）になったらmaking_status を製作待ち（１）に自動更新

  def subtotal
    item.with_tax_price * amount
  end


end
