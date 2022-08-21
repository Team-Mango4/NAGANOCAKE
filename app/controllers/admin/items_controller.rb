class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
       redirect_to "/admin/items/#{item.id}"
    else
       render action: :new
    end
  end

  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
   item = Item.find(params[:id])
    if item.update(item_params)
     redirect_to "/admin/items/#{item.id}"
    else
     render action: :edit
    end
  end

  protected

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end

end
