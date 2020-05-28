Rails.application.routes.draw do
  get '/', to: "home#index"
  resources :characters
  resources :sessions

  resources :campaigns do 
    resources :sessions 
  end 

  resources :users do
    resources :characters
    resources :campaigns
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
