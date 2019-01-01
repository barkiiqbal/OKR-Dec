Rails.application.routes.draw do
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

  root "as_runs#index"
  # root "as_runs#new"
end
