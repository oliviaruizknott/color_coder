Rails.application.routes.draw do
  devise_for :users

  root "colors#index"
  resources :colors, except: [:destroy]
end
