Rails.application.routes.draw do
  devise_for :users
  get 'tasks/index'
  root to: "tasks#index"
  resources :users, only: [:edit, :update]
end
