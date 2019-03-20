Rails.application.routes.draw do

  resources :trips
  root to: "home#index"
  get 'home/about_us', to: "home#about_us"
  get 'home/contact', to: "home#contact"
  get 'home/team', to: "home#team"
  get 'home/not_found', to: "home#not_found"

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  
  
  resources :users do
    resources :avatars, only: [:create]
    resources :user_pictures, only: [:create, :destroy]
  end

  resources :tickets


  resources :correspondances
  resources :comments
  resources :conversations, only: [:index, :create, :new] do
    resources :messages, only: [:index, :create]
    resources :answers, only: [:new, :create]
  end

  
  resources :flats do
    resources :flat_pictures, only: [:create, :destroy]
  end
  resources :cities
  resources :user_preferences, only: [:create, :new]

  namespace :admins do
    resources :users, only: [:index, :update]
    resources :cities, except: [:show, :edit, :new]
    resources :languages, except: [:show, :edit, :new]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
