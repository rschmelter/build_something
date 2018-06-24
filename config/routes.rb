Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :users, only: [:show] do 
    resources :projects
  end

  resources :users, only: [:show] do
    resources :materials
  end

  resources :projects, only: [:index, :show]
    



  resources :users

  


end
