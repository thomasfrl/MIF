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



  resources :users, only: [:update, :show, :edit, :index] do
    resources :avatars, only: [:create]
    resources :user_pictures, only: [:create, :destroy]
    resources :comments, only: [:index, :create]
  end


  resources :correspondances, except: [:show, :edit, :new]

  resources :conversations, only: [:index] do
    resources :messages, only: [:index, :create]
    resources :answers, only: [:new, :create]
    resources :trips, only: [:new, :create]
  end

  resources :flats, except: [:destroy, :index, :new] do
    resources :flat_pictures, only: [:create, :destroy]
  end
  
  resources :cities, only: [:show, :index]

  resources :user_preferences, only: [:create, :new]

  namespace :admins do
    resources :users, only: [:index, :update]
    resources :cities, except: [:show, :edit, :new, :destroy]
    resources :languages, except: [:show, :edit, :new]
    root to: "admins#index"

  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
