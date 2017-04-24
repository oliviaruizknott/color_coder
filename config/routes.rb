Rails.application.routes.draw do
  devise_for :users

  root "colors#index"
  resources :colors, except: [:destroy] do
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  get '/api/colors', to: "colors#data"
  get '/api/reviews', to: "reviews#data"
  get '/api/users', to: "users#data"
end
