Rails.application.routes.draw do
  post '/adventures/:id', to: 'battles#create'
  root 'sessions#home'
  
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
