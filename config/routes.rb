Rails.application.routes.draw do
  get 'walks/index'
  get 'walks/show'
  get 'walks/new'
  get 'walks/create'
  get 'walks/update'
  get 'walks/create'
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/create'
  get 'groups/update'
  get 'groups/delete'
  get 'profiles/index'
  get 'profiles/show'
  get 'profiles/new'
  get 'profiles/create'
  get 'profiles/update'
  get 'profiles/delete'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/update'
  get 'users/delete'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
