Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies do
    member do
      post :toggle_available_status
    end
  end
  resources :users
  get 'search', to: 'movies#search'

  root 'movies#index'
end
