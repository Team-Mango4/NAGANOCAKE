class Admin::OrdersController < ApplicationController

 def index
  @orders = Order.all
 end

 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details.all
  @subtotal = 0
 end

 def update
  order = Order.find(params[:id])
  if order.update(order_params)
   redirect_to admin_order_path(order.id)
  else
   render :show
  end
 end

 protected

 def order_params
  params.require(:order).permit(:post_code, :name, :ship_address, :shipping_cost, :total_payment, :payment_method, :status)
 end

end
