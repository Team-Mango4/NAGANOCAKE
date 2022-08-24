class OrderDetail < ApplicationRecord
  enum making_status: { 着手不可: 0, 製作待ち: 1, 製作中:2,製作完了:3}
  belongs_to :order
  belongs_to :item
  
  #小計を求めるためのメソッド(カートモデルに記載のメソッドと同じもの)
  def subtotal
    item.with_tax_price * amount
  end

end