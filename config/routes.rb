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
  # get '/characters/student', to: 'characters#student', as: 'student'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
