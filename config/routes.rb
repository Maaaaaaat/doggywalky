Rails.application.routes.draw do

  get 'search', to: 'pages#search'

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :profiles, only: [:show, :new, :create, :edit, :update] do
    resources :groups, only: [:index, :new, :create, :show]
  end

  resources :groups, only: [:delete, :update] do
    resources :walks, only: [:new, :show, :index, :create]
  end

  resources :walks, only: [:delete, :edit, :update]
  resources :pets, only: [:index]
  # root "posts#index"
end
