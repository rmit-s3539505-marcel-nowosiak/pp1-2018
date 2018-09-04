Rails.application.routes.draw do
   root 'dashboards#index'
  
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

  # resources :listings
  # resources :registrations
  # resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
