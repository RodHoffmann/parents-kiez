Rails.application.routes.draw do
  devise_for :users

<<<<<<< HEAD
  resources :items

  root to: "pages#home"
=======
  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :babysitters
>>>>>>> master
end
