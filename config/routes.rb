Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/setting', to: 'users#edit'
  get 'users/profile_setting'
  get 'users/portfolio_setting'
  get 'users/password_setting'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :categories
  resources :specialities
  resources :specialities_users
  resources :job_post_users
  resources :portfolios do
    resources :pictures
  end
  resources :job_posts do
    resources :job_post_comments
  end
end
