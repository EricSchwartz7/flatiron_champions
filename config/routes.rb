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
  get '/sessions', to: 'sessions#destroy', as: 'logout'
  post '/sessions', to: 'sessions#create'
  post '/battles/:id', to: 'battles#move', as: 'submit_move'
<<<<<<< HEAD


=======
>>>>>>> 59d142cd2f30fe86e352d6af332fae06a9793c08

end
