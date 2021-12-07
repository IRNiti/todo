Rails.application.routes.draw do

  root "chores#index"

  get 'signup' => 'users#new'

  resources :chores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
