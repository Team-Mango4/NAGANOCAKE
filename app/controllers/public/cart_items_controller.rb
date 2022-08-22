class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    if cart_items.find_by(item_id: )
      @cart_item_amount = cart_items.find_by(id: item_id).amount.to_i
      @cart_item.amount.to_i += params[:amount].to_i
      @cart_item.update(cart_item_params)
      #@cart_item = current_customer.cart_items.build(cart_item_params)
      #@cart_items = current_customer.cart_items.all
      #@cart_items.each do |cart_item|
        #cart_item.amount.to_i += @cart_item.item_id
    else

      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to public_items_path
    end

  end

  def update
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
