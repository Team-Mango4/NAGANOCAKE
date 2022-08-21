Rails.application.routes.draw do

  get 'customers/show'
  get 'customers/edit'
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :customers,only: [:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
  end

  namespace :public do
    root to: "homes#top"
    resources :customers,only: [:show, :edit, :update, :confirm, :destroy]
  end

end
