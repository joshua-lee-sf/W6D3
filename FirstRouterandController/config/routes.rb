Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users
  # VERB '/path' , to: 'controller#action'

  get 'users/:id', to: 'users#show', as: 'user'
  post 'users/:id', to: 'users#index', as: 'users'
  post 'users/:id', to: 'users#create'
  get 'users/', to: 'users#new', as: 'new_user'
  get 'users/:id', to: 'users#edit', as: 'edit_user'
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
end