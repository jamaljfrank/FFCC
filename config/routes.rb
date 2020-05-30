Rails.application.routes.draw do
  root 'characters#index'

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
    resources :adventures, only: %i[new create index]
  end

  resources :users do
    resources :characters, only: %i[new create index]
  end
end
