Rails.application.routes.draw do
  get '/spoonify', to: 'static_pages#home', as: 'home'

  resources :users
  get '/followers', to: 'users#followers', as: 'view_followers'
  get '/followeds', to: 'users#followeds', as: 'view_followeds'
  # get '/signup', to: 'users#new', as: 'signup'

  # sessions routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # followings routes
  post 'users/:id/follow', to: 'followings#create', as: 'follow'
  delete 'users/:id/unfollow', to: 'followings#destroy', as: 'unfollow'

  # restlists route
  get '/restlists', to: 'restlists#show', as: 'restlist'

  resources :lists
  get '/search', to: 'lists#search', as: 'search'

  resources :restaurants, except: :index
  
  resources :reservations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
