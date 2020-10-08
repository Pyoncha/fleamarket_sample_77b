Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create] do
    get '/purchase/:id', to: 'items#purchase'
    post '/purchase/:id', to: 'items#pay'
  end
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy]
  resources :user_addresses, only: [:new, :edit]
end
