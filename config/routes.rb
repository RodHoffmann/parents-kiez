Rails.application.routes.draw do
  devise_for :users

  resources :items do
    collection do
      get 'search' # Route for searching items
    end
    member do
      patch 'share' # Route for sharing an item
    end
  end

  get '/my_items', to: 'items#my_items', as: 'my_items'
  get '/shared_items', to: 'items#shared_items', as: 'shared_items'

  root to: "pages#home"
end
