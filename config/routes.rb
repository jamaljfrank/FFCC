Rails.application.routes.draw do
  resources :adventures
  resources :characters
  root 'users#index'
  resources :users

end
