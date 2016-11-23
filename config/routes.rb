Rails.application.routes.draw do

  root "home#index"

  devise_for :members
  resources :gameplays do
    resources :comments
  end
  resources :members, excpet: [:destroy]

  get '/about' , to: "pages#about"
  get '/info' , to: "pages#info"

  resources :games, only: [:index,:show]

  resources :comments do
    resources :comments
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


end
