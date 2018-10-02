Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :analytics
  root "sessions#homepage"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/users/:id/details", to: "users#details"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
