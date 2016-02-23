Rails.application.routes.draw do
  # devise_for :retailers
  # devise_for :buyers
resources :contents, only: [:index]
resources :users, only: [:show]
root to: "contents#index"
end
