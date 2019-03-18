Rails.application.routes.draw do

  get 'answers/create'
  get 'answers/show'
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
