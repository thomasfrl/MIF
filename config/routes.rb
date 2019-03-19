Rails.application.routes.draw do

  get 'user_preferences/create'
  get 'quiz/new'
  get 'quiz/create'
  get 'quiz/show'

  resources :trips
  root to: "home#index"
  get 'home/about_us', to: "home#about_us"
  get 'home/contact', to: "home#contact"
  get 'home/team', to: "home#team"

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  
  
  resources :users do
    resources :avatars, only: [:create]
  end

  resources :user_languages
  resources :tickets
  resources :correspondances
  resources :testifies
  resources :comments
  resources :conversations, only: [:index, :create, :new] do
    resources :messages, only: [:index, :create]
    resources :answers, only: [:new, :create]
  end
  resources :languages
  resources :flats do
    resources :flat_pictures
  end
  resources :users
  resources :cities
  resources :home
  resources :user_preferences, only: [:create, :new]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
