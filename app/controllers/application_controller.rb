class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, if: :just_looking?, except: [:about, :top]

    # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource.is_a?(Admin)
      admin_root_path
    else
      root_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end


  private
  #before_actionで、authenticate_customer使用時、itemのindexページのみ除外するためのメソッド
  def just_looking?
    unless controller_path == 'public/items' && action_name == 'index'
      true
    end
  end

end
