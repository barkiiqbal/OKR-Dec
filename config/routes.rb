Rails.application.routes.draw do

  devise_for :users
  # resources :logs
  # get 'logs_list/index'
  # get 'logs_list/new'
  # get 'logs_list/create'
  # get 'logs_list/destroy'
  resources :as_runs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'log_for/:as_run_id', to: 'logs#index', as: :show_logs
  get 'export_log/:as_run_id', to: 'as_runs#download_excel', as: :export_excel

  # get 'as_runs/new'
  # get 'as_runs/list'

  # root "as_runs#index"
  # root "as_runs#new"
  #
  # root to: "home#index"

  authenticated :user do
    root "as_runs#index", as: :default_login_screen
    # root new_user_session_path
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  match 'twitter_login' => "home#gem_test" ,via: [:get, :post]

  match 'twitter/callback'  =>  'home#callback' ,via: [:get, :post]
end
