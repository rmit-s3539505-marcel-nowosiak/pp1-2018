Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :employers, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :hunters, controllers: {
    sessions: 'users/sessions'
  }

  resources :listings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
