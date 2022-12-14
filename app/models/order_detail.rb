class OrderDetail < ApplicationRecord
  enum making_status: { bf_making: 0, waiting_for_making: 1, making: 2, done: 3 }
  belongs_to :order
  belongs_to :item

  #税込み小計を求めるためのメソッドを使用
  def subtotal
    item.with_tax_price * amount
  end


end
