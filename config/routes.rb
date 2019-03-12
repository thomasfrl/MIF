Rails.application.routes.draw do

  resources :user_languages
  resources :tickets
  resources :correspondances
  resources :testifies
  resources :comments
  resources :messages
  resources :conversations
  resources :languages
  resources :flats
  resources :users
  resources :cities
  resources :home


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
