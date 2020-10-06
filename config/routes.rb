Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users,controller:  {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'    
    post 'addresses', to: 'users/registrations#create_address'    
    get 'creditcards', to: 'users/registrations#new_creditcard'    
    post 'creditcards', to: 'users/registrations#create_creditcard'  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :destroy] do
    get 'purchase'
    collection do
      get :category_search
    end
  end
  resources :credit_cards, only: [:index, :new]
  resources :user_addresses, only: [:new, :edit]
  
end
