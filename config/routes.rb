Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "users/sessions" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update, :destroy]
  resources :organisations
  resources :shifts
  root to: "pages#index"
  get '/pages/react', to: 'pages#react'
end
