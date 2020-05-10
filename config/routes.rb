Rails.application.routes.draw do
  root 'sessions#home'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/auth/google_oauth2/callback" => 'sessions#create'



  resources :users do
    resources :characters, only: [:new, :create, :index]
    
  end
  resources :characters
  resources :adventures
  

end
