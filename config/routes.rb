Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  #root "welcome#index"
  devise_for :users

  resources :brands, only: [:index] do
    resources :shoes, only: [:index]
  end

  resources :shoes, only: [] do
    resources :results, only: [:index]
  end

  root to: 'brands#index'

end
