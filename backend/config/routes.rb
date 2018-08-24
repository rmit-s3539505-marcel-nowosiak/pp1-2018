Rails.application.routes.draw do
  devise_for :users, :controllers => { :passwords => "users/passwords", :confirmations => "users/confirmations" }
  devise_scope :users do
    get 'signup', to: 'users/registrations#new'
    get 'signin', to: 'users/sessions#new'
    delete 'signout', to: 'users/sessions#destroy'
  end

  resources :listings
  resources :registrations
  resources :sessions

  root "users/sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
