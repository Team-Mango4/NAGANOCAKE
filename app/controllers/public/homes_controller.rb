class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(id: "DESC")
  end

  def about
    @items = Item.all
  end

end
