class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    # ジャンルのルートページ
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.order(created_at: :desc).all
    else
      @items = Item.order(created_at: :desc).all
    end
    
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
