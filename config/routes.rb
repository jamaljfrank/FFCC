Rails.application.routes.draw do
  
  root 'sessions#home'

  post '/adventures/:id', to: 'battles#create'
  
  get '/users/:id/party', to: 'characters#index'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#google'
  get '/auth/failure', to: redirect('/')

  resources :adventures 
  resources :characters
  resources :battles
  

  resources :users do
    resources :characters, only: [:new, :create, :index]
  end

  
end
