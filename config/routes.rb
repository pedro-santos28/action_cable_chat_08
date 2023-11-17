Rails.application.routes.draw do
  resources :languages, only: [:index]
  devise_for :users
  root "site#index"
end
