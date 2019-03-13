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
  resources :users, param: :username do
    member do
      get "followings"
      get "followers"
    end
  end


  get ':username', to: 'users#show', as: :profile
  get ':username/edit', to: 'users#edit', as: :edit_profile
  patch ':username/edit', to: 'users#update', as: :update_profile

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"
end
