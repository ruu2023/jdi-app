Rails.application.routes.draw do
  devise_for :users
  get 'tasks/index'
  root to: "tasks#index"
  resources :users, only: [:edit, :update]
  # resources :folders, only: [:new, :create] do
  # end
  resources :tasks, only: [:index, :create, :destroy] do
    collection do
      delete 'destroy_all', to: 'tasks#destroy_all'
    end
    member do
      put :sort
      patch 'mark_as_done'
    end
  end
end
