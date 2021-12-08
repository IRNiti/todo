Rails.application.routes.draw do

  root "chores#index"

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :users
  resources :chores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
