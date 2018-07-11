Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  get "/signin", to: "sessions#new" 
  post "/sessions/create", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  get '/auth/github/callback', to: 'sessions#create'


  resources :users do 
    resources :projects, except: [:index]
  end

  get "/users/:id/projects", to: "users#projects"

  resources :projects, only: [:index, :show, :create, :update]
  resources :materials


end
