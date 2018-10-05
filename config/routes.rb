Rails.application.routes.draw do
  resources :educations, only: [:create, :new]
  resources :positions, only: [:create, :new]

  resources :users

  root "sessions#homepage"
  get "/analytics", to: "analytics#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#logout"
  get "/users/:id/resume_form", to: "users#resume_form"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
