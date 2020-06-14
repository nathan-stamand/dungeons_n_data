Rails.application.routes.draw do
  get '/', to: "home#index"
  root "home#index"

  resources :characters

  resources :dnd_sessions
  resources :campaigns do 
    resources :dnd_sessions 
  end

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  get "/users/login", to: "sessions#new"
  post "/users/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users do
    resources :characters
    resources :campaigns
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
