class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
       redirect_to "admin/items"
    else
       render :new
    end
  end

  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  protected

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active)
  end

end
