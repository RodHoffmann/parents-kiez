Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  resources :items
  resources :babysitters
  resources :events
  resources :chatrooms, only: [:show, :new, :create] do
    resources :messages, only: :create
  end
  resources :chatrooms, only: :index
end
