Rails.application.routes.draw do
  devise_for :users
  
  root "events#index"

  resources :events
  # resources :users
  
  
  
  get 'events/index', to: "events#index"
  get 'events/create'
  get 'events/new'
  get 'events/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
