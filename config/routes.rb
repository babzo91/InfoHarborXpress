Rails.application.routes.draw do
  resources :searches, only: [:new, :create, :show] do
    resources :results, only: [:new, :create, :show]
  end
  devise_for :users
  root to: "pages#home"
  # get "up" => "rails/health#show", as: :rails_health_check
end
