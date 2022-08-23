class Public::OrdersController < ApplicationController
    # 注文情報入力/public/orders/new
    def new
        @order = Order.new
    end
    # POST注文情報確認/public/orders/confirm
    def confirm
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
		@cart_items = current_customer.cart_items
		@shipping_cost = 800
		@total =0
		@total_payment = 0
		@order.payment_method = params[:order][:payment_method]
		if params["address_option"] == "0"
			@order.post_code = current_customer.post_code
			@order.ship_address = current_customer.address
			@order.name = current_customer.first_name + current_customer.last_name


		elsif params["address_option"] == "1"
            @ship = Ship.find(params[:order][:ship_id])
            @order.post_code = @ship.post_code
            @order.ship_address = @ship.address
            @order.name = @ship.name


		elsif params["address_option"] == "2"
			@order.post_code = params[:order][:post_code]
			@order.ship_address = params[:order][:ship_address]
			@order.name = params[:order][:name]
		end
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
        @orders = current_customer.orders.all
    end
    # 詳細/public/orders/:id
    def show
        @order_detail = OrderDetail.find(params[:id])
    end

    private

    def order_params
        params.require(:order).permit(:payment_method, :post_code, :ship_address, :name)
    end
end
