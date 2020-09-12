Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :uploads, only: %w(create)
  resources :financial_transactions, only: %w(index destroy)
  resources :stores, only: %w(show)

  root to: "financial_transactions#index"
end
