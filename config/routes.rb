Rails.application.routes.draw do
  devise_for :users
  get 'tasks/index'
  root to: "tasks#index"
  resources :users, only: [:edit, :update]
  resources :folders, only: [:new, :create] do
    resources :tasks, only: [:index, :create, :destroy, :update] do
      collection do
        delete 'destroy_all', to: 'tasks#destroy_all'
      end
      member do
        put :sort
      end
    end
  end
end
