class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
