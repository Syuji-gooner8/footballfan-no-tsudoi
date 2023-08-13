Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用
# URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords],controllers:{
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
   
  devise_scope :customer do
    post "customers/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
  root to: "homes#top"
  get "homes/about"=>"homes#about", as: "about"
  resources :soccer_groups, only: [:index, :create]
  resources :posts do
   resources :comments, only: [:create, :destroy]
   resources :likes, only: [:index, :create, :destroy]
  end

  get "/customers/check" => "customers#check"
  patch "/customers/withdraw" => "customers#withdraw"
  get "customers/mypage" => "customers#show"
  get "customers/information/:id/edit" => "customers#edit", as: "mypageedit"
  patch "customers/information" => "customers#update"
  end


  namespace :admin do

  get "/" => "homes#top"
  resources :soccer_groups
  resources :customers, only: [:index, :show, :edit, :update]
  resources :posts, only: [:index, :show, :destroy] do
  resources :posts_comments, only: [:show, :destroy]
  end
end
end