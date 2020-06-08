Rails.application.routes.draw do
  get '/', to: "home#index"
  root "home#index"
  patch "/characters/:id" => "characters#show"
  resources :characters
  resources :dnd_sessions
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  resources :campaigns do 
    resources :dnd_sessions 
  end 

  get "/users/login", to: "users#login"
  post "/users/login", to: "users#login"
  get "/users/logout", to: "users#logout"
  resources :users do
    resources :characters
    resources :campaigns
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
