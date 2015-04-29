Rails.application.routes.draw do

  #root "welcome#index"
  #devise_for :users

  resources :brands, only: [:index] do
    resources :shoes, only: [:index]
  end

  root to: 'brands#index'

end
