Rails.application.routes.draw do
  root 'users#index'
  devise_for :users

  resources :databases, only:[:index] do
    member do
      get :item
      get :champion
    end
  end

  resources :users, only: [:index, :show] do
    member do
      get :favorites
      get :itemsetLists
    end
  end

  resources :itemsets do
    resources :favorites, only: [:index, :create, :destroy]
  end

end
