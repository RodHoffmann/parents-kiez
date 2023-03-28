Rails.application.routes.draw do
  devise_for :users

  resources :items do
    collection do
      get 'search'
    end
    member do
      get 'share'
      patch 'share'
    end
    member do
      patch 'reserve'
      post 'create_reservation'
    end
    get 'reserve', on: :member
    resources :reservations, only: [:index, :new, :create]
  end
    resources :reservations, only: [:show, :edit, :update, :destroy]

  root to: "pages#home"
end
