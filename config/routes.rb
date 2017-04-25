Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # match 'users/:id' => 'users#destroy', :via => :delete # :as => :admin_destroy_user

  root "colors#index"
  resources :colors do
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  get '/api/colors', to: "colors#data"
  get '/api/reviews', to: "reviews#data"
  get '/api/users', to: "users#data"
end
