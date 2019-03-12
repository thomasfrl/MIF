Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: "home#index"
  
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

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
