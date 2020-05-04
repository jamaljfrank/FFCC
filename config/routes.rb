Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get '/signup' => 'users#new'


  resources :adventures
  resources :characters
  resources :users

end
