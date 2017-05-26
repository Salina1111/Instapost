Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
  	resources :comments
  	resources :upvotes, only: :create
  	resources :downvotes, only: :create
  end
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
