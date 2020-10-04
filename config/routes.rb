Rails.application.routes.draw do
# コンフリクトが起きたのでコメントアウトしてます。（橋本）
  ##devise_for :users,controller:  {
   # sessions: 'users/sessions',
    #registrations: 'users/registrations'
    }
# こちらも同じです
  #devise_scope :user do
    #get 'addresses', to: 'users/registrations#new_address'    
    #post 'addresses', to: 'users/registrations#create_address'    
    # get 'creditcards', to: 'users/registrations#new_creditcard'    
    # post 'creditcards', to: 'users/registrations#create_creditcard'  
  end
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show] do
    get 'purchase'
    collection do
      get :category_search
    end
  end
  resources :credit_cards, only: [:index, :new]
  resources :user_addresses, only: [:new, :edit]
  
end
