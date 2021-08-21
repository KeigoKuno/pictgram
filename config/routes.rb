Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  root "pages#index"
  get "pages/help"
  get "pages/link"
  
  
  resources :users
  resources :topics
  resources :posts do  #postsコントローラへのルーティング  
    resources :comments, only: [:create]  #commentsコントローラへのルーティング
  end

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end