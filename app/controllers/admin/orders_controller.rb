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
  @order = Order.find(params[:id])
  @order.update(order_params)
  @order_details = @order.order_details
  if @order.status == "payment_comfirmation"
    @order_details.each do|order_detail|
    order_detail.making_status = "waiting_for_making"
    order_detail.save
   end
  end
  redirect_to admin_order_path(@order.id)
 end


 protected

 def order_params
  params.require(:order).permit(:post_code, :name, :ship_address, :shipping_cost, :total_payment, :payment_method, :status)
 end

end
