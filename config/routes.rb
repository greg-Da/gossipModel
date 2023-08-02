Rails.application.routes.draw do
  resources :comments
  get 'users/show'
  get 'gossip/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "gossips#index"
  
  resources :gossips do
    resources :comments
  end

  get "/user/:id", to: "users#show"

  get "/city/:id", to: "cities#show"

  get "/team", to: "static_pages#team"
  get "/contact", to: "static_pages#contact"
  get "/welcome/:first_name", to: "static_pages#welcome"
end