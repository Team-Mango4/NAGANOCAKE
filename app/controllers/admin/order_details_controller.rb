class Admin::OrderDetailsController < ApplicationController

 def show
  @order = Order.find(params[order_id])
  @order_details = @order.order_details.all
 end

 def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  @order_details = @order.order_details
  @order_detail.update(order_detail_params)
  if @order_details.where(making_status: "making").count >= 1
   @order.status = "making"
   @order.save
  end

  if @order.order_details.count == @order_details.where(making_status: "done").count
   @order.status = "ready_for_send"
   @order.save
  end
  redirect_to admin_order_path(@order.id)
 end

 private

 def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
 end

end
