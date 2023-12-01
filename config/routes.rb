Rails.application.routes.draw do
  resources :searches, only: [:new, :create, :show] do
    resources :results, only: [:new, :create, :show]
    get :results, to: "results#save_csv", as: :save_csv
  end
  get '/searches/:id/download_csv', to: 'results#download_csv', as: :download_csv_search
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  devise_for :users
  root to: "pages#home"
  # get "up" => "rails/health#show", as: :rails_health_check
end
