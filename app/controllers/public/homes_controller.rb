class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(id: "DESC")
  end

  def about
    @items = Item.all
    
    @item = Item.last(1)
  end

end
