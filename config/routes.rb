Rails.application.routes.draw do
  get 'index/brands'
  get 'index/shoes'
  get 'index/results'



  #root "welcome#index"
  # devise_for :users


  # resources :brand, only: [:index] do
  #   resources :shoe, only: [:index] do
  #     resources :results, only: [:index]
  #   end
  # end
end
