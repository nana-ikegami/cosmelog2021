Rails.application.routes.draw do
  devise_for :users
  # get 'cosmes/index'
  root to: "cosmes#index"
  resources :users, only: [:show]
  resources :cosmes, only: [:index, :new, :create, :show, :update, :edit, :destroy]do
    resources :comments, only: [:create]
  end
end
