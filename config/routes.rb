Rails.application.routes.draw do
  get 'browse', to: 'posts#browse', as: :browse_posts 
   post ':user_id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

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

