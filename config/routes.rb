Rails.application.routes.draw do
  root 'sessions#home'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#google'
  get '/auth/failure', to: redirect('/')

  resources :users do
    resources :characters, only: [:new, :create, :index]
  end
  resources :users do
    resources :adventures
  end
  resources :adventures
    resources :characters, only: [:new, :create, :index]
  end
  resources :characters
  

end
