Rails.application.routes.draw do
  devise_for :users
  resources :users

  root "events#index"

  # resources :events
  # resources :rsvps, only: [:create, :destroy]
  
  resources :events do
    resources :rsvps
  end

  # resources :users do
  #   resources :rsvps, only: [:index, :new, :create]
  # end
  # resources :rsvps, only: :destroy
  
  # post '/events/:id/rsvp', to: 'events#rsvp'
  # post '/events/:id/rsvp', to: 'events#rsvp', as: 'attend_event'
  
  
  # get 'events/index', to: "events#index"
  # get 'events/create'
  # get 'events/new'
  # get 'events/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
