Rails.application.routes.draw do
  resources :gyms , only: [:index, :show , :update, :destroy]
  resources :memberships , only: [:index, :create, :update]
  resources :clients , only: [:index, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
