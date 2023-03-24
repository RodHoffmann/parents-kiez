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

  root to: "pages#home"
end
