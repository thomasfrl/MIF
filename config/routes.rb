Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users

  resources :user_languages
  resources :tickets
  resources :correspondances
  resources :testifies
  resources :comments
  resources :conversations, only: [:index, :create, :new] do
    resources :messages, only: [:index, :create]
  end
  resources :languages
  resources :flats
  resources :users
  resources :cities
  resources :home




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
