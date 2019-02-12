Rails.application.routes.draw do
  use_doorkeeper

  resources :items

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "home#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
