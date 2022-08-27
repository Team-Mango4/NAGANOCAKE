Rails.application.routes.draw do



  get 'finders/finder'
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
    resources :order_details, only:[:show, :update]
    resources :items
  end

  namespace :public do
    get "/orders/complete" => "orders#complete"
    post "/orders/confirm" => "orders#confirm"
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    get 'finder' => "finders#finder"
    resources :customers,only: [:index, :show, :edit, :update]
    resources :orders, only:[:new, :index, :show, :create]
    resources :ships, only:[:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'destroy_all' => 'cart_items#destroy_all'
  end
end
