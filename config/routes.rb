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

  
  get 'static_pages/graphic_designer'
  get 'static_pages/brand_designer'
  get 'static_pages/uiux_designer'
  get 'static_pages/3d_animator'
  get 'static_pages/3d_modeler'
  get 'static_pages/3d_renderer'
  get 'static_pages/drafter'

  get 'static_pages/cinematrographer'
  get 'static_pages/director'
  get 'static_pages/script_writer'
  get 'static_pages/content_writer'
  get 'static_pages/talent'
  get 'static_pages/motion_grapher'

  get 'static_pages/photographer'

  get 'static_pages/web_programmer'

  get 'static_pages/music_editor'
  get 'static_pages/audio_engineer'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  resources :categories
  resources :specialities
  resources :specialities_users
  resources :job_post_users
  resources :contacts
  resources :notifications
  resources :profile_pictures
  resources :portfolios do
    resources :pictures
  end
  resources :portfolios do
    resources :portfolio_comments
  end
  resources :job_posts do
    resources :job_post_comments
  end
  resources :message_users do
    resources :messages
  end
  resources :portfolio_view_likes do
    member do
      get :like
      put :like
    end
  end
end
