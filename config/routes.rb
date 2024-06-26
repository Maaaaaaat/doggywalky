Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'search', to: 'pages#search'

  # Defines the root path route ("/")
  resources :profiles, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :groups, only: [:index, :new, :create, :show]
  end

  resources :groups, only: [:delete, :update] do
    resources :walks, only: [:new, :show, :index, :create]
  end

  resources :walks, only: [:delete, :edit, :update]

  resources :groups do
    get 'group_user', to: 'groups#group_user'
  end

  resources :groups do
    post 'join', to: 'groups#join'
  end

  resources :walks do
    post 'join', to: 'walks#join'
  end

  resources :profile_walks do
    delete 'quit', to: 'walks#quit'
  end

    resources :profile_groups do
      delete 'quit', to: 'groups#quit'
  end

  # require "sidekiq/web"
  # authenticate :user, ->(user) do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  end
  # root "posts#index"
