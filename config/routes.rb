Rails.application.routes.draw do

  root "users#index"

  resources :deeds
  resources :gifts
  resources :follows
  resources :users

  # put "/follows/:id/new", to: "follow#create", as: "new_follow_path
  # get '/users/:id/new_gift', to: 'users#new_gift', as: "gift_user"
  post '/users/:id/new_gift', to: "users#create_gift", as: "create_gift"

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  get "/login", to: "login#new", as: "/login"
  post "/login", to: "login#create"
  # resources :login, only: [:create]
  delete "/logout", to: "login#destroy"
end
