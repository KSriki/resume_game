Rails.application.routes.draw do
  resources :users
  resources :educations
  resources :institutions
  resources :positions
  resources :companies
  resources :industries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
