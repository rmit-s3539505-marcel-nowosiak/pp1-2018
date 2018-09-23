Rails.application.routes.draw do
  # get 'hunter_profiles/new'
  root 'dashboards#index'

  resources :hunter_profiles do
    member do
      get 'offer'
      post 'offer'
    end
  end

  devise_for :users, :controllers => {
    :registrations => "users/registrations",
    :sessions => "users/sessions",
    :passwords => "users/passwords",
    :confirmations => "users/confirmations"
  }
  devise_scope :users do
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_in', to: 'users/sessions#new'
    delete 'sign_out', to: 'users/sessions#destroy'
  end

  # post 'offer', to: 'hunter_profiles#create_offer'

  resources :listings
  # resources :registrations
  # resources :sessions
  resources :hunter_profiles


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
