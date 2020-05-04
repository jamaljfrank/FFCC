Rails.application.routes.draw do
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  resources :adventures
  resources :characters
  resources :users

end
