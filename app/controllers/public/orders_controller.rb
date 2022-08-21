class Public::OrdersController < ApplicationController
    # 注文情報入力/public/orders/new
    def new
        @order = Order.new(order_params)
    end
    
    # POST注文情報確認/public/orders/confirm
    def confirm
        @order = Order.new(order_params)
        @Ship = Ship.find(params[:order][:ship_id])
        @order.postal_code = @ship.post_code
        @order.address = @ship.address
        @order.name = @ship.name
    end
    
    # 注文完了/public/orders/complete
    def complete
    end
    
    # 確定
    def create
        order = Order.new(order_params)
        order.save
        redirect_to public_orders_complete_path
    end
    # 履歴/public/orders
    def index
        @order_details = OrderDetail.all
    end
    # 詳細/public/orders/:id
    def show
        @order_detail = OrderDetail.find(params[:id])  
    end
    
    private

    def order_params
        params.require(:order).permit(:post_code, :name, :ship_address, :shipping_cost, :total_payment, :payment_method, :status)
    end
end
