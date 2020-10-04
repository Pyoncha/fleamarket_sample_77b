Rails.application.routes.draw do


  devise_for :users,controller:  {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }


  # ↓詳細ページ用のログアウト機能として仮置き
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # devise_for :users,controller:  {
  #   sessions: 'users/sessions',
  #   registrations: 'uers/registrations'
  # }

  # devise_scope :user do
  #   get 'addresses', to: 'users/registrations#new_address'    
  #   post 'addresses', to: 'users/registrations#create_address'    
  #   # get 'creditcards', to: 'users/registrations#new_creditcard'    
  #   # post 'creditcards', to: 'users/registrations#create_creditcard' 
  #   # ↓商品詳細ページ用のログアウト機能として仮置き
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

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
