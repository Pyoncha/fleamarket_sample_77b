Rails.application.routes.draw do

  devise_for :users,controller:  {
    sessions: 'users/sessions',
    registrations: 'uers/registrations'
   }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'    
    post 'addresses', to: 'users/registrations#create_address'    
    # get 'creditcards', to: 'users/registrations#new_creditcard'    
    # post 'creditcards', to: 'users/registrations#create_creditcard'  
  end
  root 'items#index'
  resources :items, only: [:index, :new, :create] do
    get 'purchase'
  end
  resources :credit_cards, only: [:index, :new]
  resources :user_addresses, only: [:new, :edit]
end
