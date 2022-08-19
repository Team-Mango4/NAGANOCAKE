Rails.application.routes.draw do



  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'
   get 'about' => 'public/homes#about'

  namespace :admin do
    root to: "homes#top"
    resources :customers,only: [:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :genres, only:[:index, :create, :edit, :update]
  end

  namespace :public do
    get 'cart_items' => 'cart_items#index'
    resources :cart_items, only: [:create, :update, :destroy]
    delete 'destroy_all' => 'cart_items#destroy_all'
  end


end
