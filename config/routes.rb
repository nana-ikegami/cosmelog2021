Rails.application.routes.draw do
  devise_for :users
  # get 'cosmes/index'
  root to: "cosmes#index"
  resources :cosmes, only: [:index, :new, :create, :show]
end
