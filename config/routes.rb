Rails.application.routes.draw do


  resources :trips
  root to: "home#index"
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }



  resources :users, :path=> "friends", only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end

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
