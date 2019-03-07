Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :tweets
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :tweets
  resources :followings
  resources :followers
  resources :user_tweets
  resources :users do
    member do
      get "followings"
      get "followers"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"
end
