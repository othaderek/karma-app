Rails.application.routes.draw do
  resources :deeds
  resources :gifts
  resources :follows
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
