class Item < ApplicationRecord
 has_many :order_details,dependent: :destroy
 has_one_attached :image
 belongs_to :genre

 validates :name, presence: true
 validates :introduction, presence: true, length: { maximum: 200 }
 validates :image, presence: true

  #itemの金額(price)の税込表示をするためのメソッド
  def with_tax_price
    (price * 1.1).floor
  end

 def self.looks(search, word)
    if search == "perfect_match"
      @items = Item.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @items = Item.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @items = Item.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @items = Item.where("name LIKE?","%#{word}%")
    else
      @items = Item.all
    end
  end

end
