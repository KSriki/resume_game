Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :analytics
  root "sessions#homepage"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/users/:id/resume_form", to: "users#resume_form"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
