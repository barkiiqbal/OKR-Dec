Rails.application.routes.draw do
  resources :logs
  get 'logs_list/index'
  get 'logs_list/new'
  get 'logs_list/create'
  get 'logs_list/destroy'
  resources :as_runs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root "as_runs#index"
  root "as_runs#new"
end
