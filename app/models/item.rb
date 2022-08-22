class Item < ApplicationRecord
 has_one_attached :image

 validates :name, presence: true
 validates :introduction, presence: true, length: { maximum: 200 }
 validates :image, presence: true

  #itemの金額(price)の税込表示をするためのアクション
  def with_tax_price
    (price * 1.1.floor)
  end

end
