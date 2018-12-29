Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create, :destroy]
  # get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :lists
  resources :restlists, only: :show
  resources :restaurants
  resources :follows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
