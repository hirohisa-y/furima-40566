Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :records, only: [:index, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/"e
  # root "articles#index"
end
