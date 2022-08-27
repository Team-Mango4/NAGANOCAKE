class Ship < ApplicationRecord
  belongs_to :customer
  
  def ship_display
  '〒' + post_code + ' ' + address + ' ' + name
  end
  
end
