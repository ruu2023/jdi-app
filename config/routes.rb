Rails.application.routes.draw do
  devise_for :users
  get 'tasks/index'
  root to: "tasks#index"
  resources :users, only: [:edit, :update]
  resources :tasks, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      delete 'destroy_all', to: 'tasks#destroy_all'
    end
    member do
      put :sort
      patch 'mark_as_done', to: 'tasks#mark_as_done'
    end
  end
end
