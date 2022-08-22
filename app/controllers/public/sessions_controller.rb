# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  def after_customer_sign_out_path_for
    about_path
  end




 protected
# 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])
      ## 【処理内容3】
      if @customer.is_deleted
        redirect_to "/customers/sign_up"
      end
    end
  end
end
