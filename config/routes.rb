Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies
  resources :users
  get 'search', to: 'movies#search'
  root 'movies#index'
end
