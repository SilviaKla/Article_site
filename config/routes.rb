Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  get "profile", to: "pages#profil"
  resources :articles do
    resources :reviews, only: [ :create,:destroy ]
    resources :favourites, only: [ :create,:destroy ]
  end

end
