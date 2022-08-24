class Admin::OrderDetailsController < ApplicationController

 def show
  @order_detail = OrderDetail.find(params[:id])
  @item = @order_detail.item
 end

 def update
  @order_detail = OrderDetail.find(params[:id])
 end

 private

 def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
 end

end
