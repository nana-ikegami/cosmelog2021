Rails.application.routes.draw do
  get 'cosmes/index'
  get 'messages/index'
  root to: "cosmes#index"
end
