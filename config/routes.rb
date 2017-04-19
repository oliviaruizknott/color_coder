Rails.application.routes.draw do
  root "colors#index"
  resources :colors, except: [:destroy]
end
