class Item < ApplicationRecord
 has_many :order_details,dependent: :destroy
 has_one_attached :image

 validates :name, presence: true
 validates :introduction, presence: true, length: { maximum: 200 }
 validates :image, presence: true
 
end
