Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tubs, only: [:index, :show, :new, :create] do
    resources :soaks, only: [:new, :create]
  end

  get "my_tubs", to: "tubs#my_tubs", as: :my_tubs

  get "my_soaks", to: "soaks#my_soaks", as: :my_soaks

  patch "/soaks/:id/approve", to: "soaks#approve", as: :approve
  patch "/soaks/:id/deny", to: "soaks#deny", as: :deny

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
