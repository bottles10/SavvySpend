Rails.application.routes.draw do
  resources :expenses
  resources :budgets
  resources :incomes, only: %i[ new create show edit update ]
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
