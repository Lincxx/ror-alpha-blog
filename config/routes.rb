Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #to set a default root route
  root "pages#home"
  get "about", to: "pages#about"

  resources :articles
end