Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show] do
    collection do
      get :category_search
    end
  end
end
