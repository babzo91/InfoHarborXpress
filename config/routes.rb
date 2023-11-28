Rails.application.routes.draw do
  resources :results, only: [:new, :create, :show]
  resources :searchs, only: [:new, :create, :show]
  devise_for :users
  root to: "pages#home"
  # get "up" => "rails/health#show", as: :rails_health_check
end
