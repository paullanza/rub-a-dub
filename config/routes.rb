Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tubs, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end
  get "my_bookings", to: "bookings#my_bookings", as: :my_bookings
  patch "/bookings/:id/approve", to: "bookings#approve", as: :approve
  patch "/bookings/:id/deny", to: "bookings#deny", as: :deny
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
