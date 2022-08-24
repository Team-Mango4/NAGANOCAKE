class Admin::OrderDetailsController < ApplicationController

 def show
  @order = Order.find(params[order_id])
  @order_details = @order.order_details.all
 end

 def update
  order_detail = OrderDetail.find(params[:id])
  order = order_detail.order
  if order_detail.update(order_detail_params)
   redirect_to admin_order_path(order.id)
  else
   render :show
  end
 end

 private

 def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
 end

end
