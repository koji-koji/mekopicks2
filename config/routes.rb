Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  root 'articles#index'
  resources :picks
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
