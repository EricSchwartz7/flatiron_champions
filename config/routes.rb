Rails.application.routes.draw do

  root 'users#show'

  get '/users/new', to: 'users#new', as: 'signup'
  get '/users/welcome', to: 'users#welcome', as: 'welcome'
  get '/users/stats', to: 'users#stats', as: 'stats'

  get '/sessions/new', to: 'sessions#new', as: 'login'
  get '/sessions', to: 'sessions#destroy', as: 'logout'
  post '/sessions', to: 'sessions#create'

  get '/battles/new'


  get '/battles/challenge_response'
  get '/battles/destroy'

  post '/battles/:id', to: 'battles#move', as: 'submit_move'

  get '/stats/global', to: 'stats#global', as: 'global_stats'


  resources :moves
  resources :battles
  resources :abilities
  resources :characters
  resources :users

end
