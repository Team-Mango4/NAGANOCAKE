class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to admin_items_path
    else
      render new_admin_items_path
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  protected

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
