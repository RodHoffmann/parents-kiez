Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  resources :items
  resources :babysitters do
    member do
      put "upvote", to: "babysitters#upvote"
      put 'downvote', to: 'babysitters#downvote'
    end
  end
  resources :events do
    member do
      put "upvote", to: "events#upvote"
      put 'downvote', to: 'events#downvote'
    end
  end
  resources :chatrooms, only: [:show, :new, :create] do
    resources :messages, only: :create
  end
  resources :chatrooms, only: :index
end
