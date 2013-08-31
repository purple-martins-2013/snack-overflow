SnackOverflow::Application.routes.draw do

  root to: 'questions#index'

  resources :users, only: [:show, :new, :create, :destroy]
  resources :questions, only: [:index, :show, :new, :create, :destroy]
  resources :answers, only: [:create, :destroy]

  resources :sessions, only: [:create, :destroy]
  get 'sign_in' => 'sessions#new', :as => :sign_in
  get 'logout' => 'sessions#destroy', :as => :logout

end
