Rails.application.routes.draw do
  get 'items/index'

  root 'users#index'
  devise_for :users

  resources :champions, only:[:index, :show]

  resources :users, only: [:index, :show] do
    resources :profiles, only: [:new, :edit, :create, :update] do
      member do
        get :champion_select
        patch :update_champion
      end
    end
    member do
      get :favorites
      get :itemsetLists
    end
  end

  resources :itemsets do
    resources :favorites, only: [:index, :create, :destroy]
  end

end
