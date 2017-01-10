Rails.application.routes.draw do
  root 'users#show'
  resources :moves
  resources :battles
  resources :abilities
  resources :characters
  resources :users
  get '/users/new', to: 'users#new', as: 'signup'
  get '/users/welcome', to: 'users#welcome', as: 'welcome'
  get '/sessions/new', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  post '/battles', to: 'battles#move', as: 'submit_move'



end
