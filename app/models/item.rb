class Item < ApplicationRecord
 has_one_attached :image
 belongs_to :genre

 validates :name, presence: true
 validates :introduction, presence: true, length: { maximum: 200 }
 validates :image, presence: true

end
