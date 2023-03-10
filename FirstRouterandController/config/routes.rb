Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users
  # VERB '/path' , to: 'controller#action'

  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users', to: 'users#index', as: 'users'
  # post '/users/:id', to: 'users#create'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id', to: 'users#edit', as: 'edit_user'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :users, except: [:new, :edit] do
    resources :art_works, only: [:index]
    resources :comments, only: [:index]
    resources :likes, only: [:index]
  end

  resources :art_works, except: [:index, :new, :edit] do
    resources :comments, only: [:index]
    resources :likes, only: [:index]
  end

  resources :artwork_shares, only: [:create, :index, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
end
