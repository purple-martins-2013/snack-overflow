SnackOverflow::Application.routes.draw do

  root to: 'questions#index'

  resources :users, only: [:show, :new, :create, :destroy]
  resources :questions, only: [:index, :show, :new, :create, :destroy] do
    resources :answers, only: [:create]
  end
  resources :answers, only: [:destroy]

  resources :sessions, only: [:create, :destroy]
  get 'sign_in' => 'sessions#new', :as => :sign_in
  get 'logout' => 'sessions#destroy', :as => :logout

end
