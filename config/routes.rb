Rails.application.routes.draw do
  get '/signup' => 'users#new'


  resources :adventures
  resources :characters
  resources :users

end
