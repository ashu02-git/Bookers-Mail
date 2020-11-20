Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:new, :create, :index, :edit, :update, :destroy]
end