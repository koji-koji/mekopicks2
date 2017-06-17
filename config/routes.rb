Rails.application.routes.draw do
  resources :tags
  # get 'users/show'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  root 'articles#index'
  resources :users, only: :show
  resources :articles do
      resources :picks ,only: [:create, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
