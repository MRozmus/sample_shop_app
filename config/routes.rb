Rails.application.routes.draw do
  devise_for :admins, skip: :registrations

  root "products#index"
  resources :products
  get 'products,:sort_params', to: 'products#index', as: :sorted_products
end
