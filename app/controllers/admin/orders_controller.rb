class Admin::OrdersController < ApplicationController

 def index
  @orders = Order.all
 end

 def show
  @order = Order.find(params[:id])
  @order_detail = OrderDetail.find(params[:id])
  @item = @order_detail.item
 end

 def update
 end

 protected

 def order_params
  params.require(:order).permit(:post_code, :name, :ship_address, :shipping_cost, :total_payment, :payment_method, :status)
 end

end
