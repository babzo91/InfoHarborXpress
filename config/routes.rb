Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  resources :compares
  resources :searches, only: [:new, :create, :show, :destroy] do
    resources :results, only: [:new, :create, :show]
    get :results, to: "results#save_csv", as: :save_csv
  end
  # get '/searches/:id/download_csv', to: 'results#download_csv', as: :download_csv_search
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  devise_for :users
  root to: "pages#home"
  # get "up" => "rails/health#show", as: :rails_health_check
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
