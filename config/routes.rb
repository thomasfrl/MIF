Rails.application.routes.draw do

  resources :tickets
  resources :correspondances
  resources :trips
  resources :testifies
  resources :comments
  resources :conversations
  resources :messages
  resources :languages
  resources :flats
  resources :cities
  resources :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
