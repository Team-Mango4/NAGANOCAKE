class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(item_id: @cart_item.item_id)
      @cart_item_past = CartItem.find_by(item_id: @cart_item.item_id)
      @cart_item.amount +=  @cart_item_past.amount
      @cart_item.save
      @cart_item_past.destroy
    else
      @cart_item = CartItem.new(cart_item_params)
    end
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
