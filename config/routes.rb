Rails.application.routes.draw do

  # get 'shoes/index'

  # get 'brands/index'

  # #root "welcome#index"
  # # devise_for :users


  resources :brands, only: [:index] do
    resources :shoes, only: [:index] do
      # resources :results, only: [:index]
    end
  end

  # root to: 'brands#index'
end
