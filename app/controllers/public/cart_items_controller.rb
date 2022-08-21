class Public::CartItemsController < ApplicationController

  def index
<<<<<<< HEAD
    @cart_items = CartItem.all
=======
    puts hi
>>>>>>> origin/develop
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

<<<<<<< HEAD

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

=======
>>>>>>> origin/develop
end
