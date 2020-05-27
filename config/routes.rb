Rails.application.routes.draw do
  get 'home/index'
  resources :characters
  resources :sessions
  resources :campaigns
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
