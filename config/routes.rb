Rails.application.routes.draw do
  root 'sessions#home'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'




  resources :adventures
  resources :characters
  resources :users

end
