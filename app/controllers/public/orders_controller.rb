class Public::OrdersController < ApplicationController
    # 注文情報入力/public/orders/new
    def new
        @order = Order.new
        @customer = current_customer
    end
    # POST注文情報確認/public/orders/confirm
    def confirm
        @order = Order.new(order_params)
        @ship = Ship.find(params[:order][:ship_id])
        @order.post_code = @ship.post_code
        @order.ship_address = @ship.address
        @order.name = @ship.name
    end

    # 注文完了/public/orders/complete
    def complete
    end

    # 確定
    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save
        redirect_to public_orders_complete_path
    end
    # 履歴/public/orders
    def index
        @order_details = OrderDetail.all
    end
    # 詳細/public/orders/:id
    def show
        @order_detail = Order_detail.find(params[:id])
    end

    private

    def order_params
        params.require(:order).permit(:payment_method, :post_code, :ship_address, :name)
    end
end
