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
    resources :genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :items, except:[:destroy]
  end

  namespace :public do
    get "/orders/complete" => "orders#complete"
    post "/orders/confirm" => "orders#confirm"
    resources :orders, only:[:new, :index, :show, :create]
    resources :ships, only:[:index, :edit, :create, :update,:destroy]
  end


end
