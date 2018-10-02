Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :analytics
  root 'sessions#homepage'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
