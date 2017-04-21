Rails.application.routes.draw do
  devise_for :users

  root "colors#index"
  resources :colors, except: [:destroy] do
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:edit, :update, :destroy]
end
