Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  get "/signin", to: "sessions#new" 
  post "/sessions/create", to: "sessions#create"
  get "/signout", to: "sessions#destroy"

  resources :users
  
  resources :users, only: [:show] do 
    resources :projects
  end

  resources :users, only: [:show] do
    resources :materials
  end

  resources :projects, only: [:index, :show]




  


end
