class Public::CustomersController < ApplicationController
  def show
      @customer = current_customer
  end

  def edit
      @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:telephone_number,:post_code,:address,:is_deleted)
  end
end
