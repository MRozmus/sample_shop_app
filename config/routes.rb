Rails.application.routes.draw do
  root "products#index"

  resources :products

  get 'products,:sort_params', to: 'products#index', as: :sorted_products
end
