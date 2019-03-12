Rails.application.routes.draw do

  get 'quiz/new'
  get 'quiz/create'
  get 'quiz/show'
  devise_for :users
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
