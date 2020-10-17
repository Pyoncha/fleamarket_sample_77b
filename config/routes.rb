Rails.application.routes.draw do
  devise_for :users,controllers:  {
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

  get 'users/profile'
  resources :users, only: [:create ,:show ,:dit, :update] do
    collection  do
      get "profile"
      get "profile_logout" 

    end
  end

  resources :items, only: [:index, :new, :create, :show, :edit, :destroy] do
    get '/purchase/:id', to: 'items#purchase', as: :purchase
    post '/purchase/:id', to: 'items#pay'
    collection do
      get :category_search
    end
  end
  resources :credit_cards, only: [:index, :new, :create, :show, :destroy]
  resources :user_addresses, only: [:new, :edit]
  
end
