Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cities, :genres, :movies, only: [:index, :show]
  resources :users
  resources :tickets, only: [:new, :create, :destroy]

  root to: 'welcome#index'
  get '/movietheatres', to: 'movie_theatres#index'
  get '/movietheatres/:id', to: 'movie_theatres#show'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end
