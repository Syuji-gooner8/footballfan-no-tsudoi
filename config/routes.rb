Rails.application.routes.draw do
  namespace :admin do
    get 'posts_comments/index'
    get 'posts_comments/show'
    get 'posts_comments/edit'
    get 'posts_comments/update'
    get 'posts_comments/destroy'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'soccerteams/index'
    get 'soccerteams/create'
    get 'soccerteams/edit'
    get 'soccerteams/update'
  end
  namespace :admin do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'soccerteams/index'
    get 'soccerteams/create'
  end
  namespace :public do
    get 'posts_likes/index'
    get 'posts_likes/create'
    get 'posts_likes/destroy'
  end
  namespace :public do
    get 'posts_comments/create'
    get 'posts_comments/destroy'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/new'
    get 'posts/create'
    get 'posts/show'
    get 'posts/edit'
    get 'posts/update'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/check'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :customers
  devise_for :admins
  get 'registrations/new'
  get 'registrations/create'
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
