Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'home/index'
  resources :events
  resources :sports
  root to: "home#index"
  resources :applicants

  devise_for :users

  resources :users, only: [:edit] do
    collection do
      get :profile
      post :update_profile
      get :products
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
