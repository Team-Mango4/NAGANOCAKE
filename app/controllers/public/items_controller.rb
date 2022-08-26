class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    @items = Item.all.page(params[:page]).per(8)

    @genres = Genre.all
    # ジャンルのルートページ
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.order(created_at: :desc).all.page(params[:page]).per(8)
    else
      @items = Item.order(created_at: :desc).all.page(params[:page]).per(8)
    end

  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
