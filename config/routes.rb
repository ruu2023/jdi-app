Rails.application.routes.draw do
  devise_for :users
  get 'tasks/index'
  root to: "tasks#index"
  resources :users, only: [:edit, :update]
  resources :tasks, only: [:index, :create, :edit, :update, :destroy] do
    collection do
      delete 'destroy_task_item', to: 'tasks#destroy_task_item'
      delete 'destroy_archive_item', to: 'tasks#destroy_archive_item'
    end
    member do
      put :sort
      patch 'mark_as_done', to: 'tasks#mark_as_done'
    end
  end
  post '/guest_sign_in', to: 'application#guest_sign_in'

end
