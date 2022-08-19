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
    resources :customers,only: [:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :genres, only:[:index, :create, :edit, :update]
  end

  namespace :public do
  end


end
