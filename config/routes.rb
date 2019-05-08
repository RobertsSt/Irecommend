Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :posts
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
    resources :comments
  end
  resources :posts do
    resources :likes
  end
  resources :followings
  resources :followers
  resources :user_posts
  resources :users, param: :username do
    member do
      get "followings"
      get "followers"
    end
  end

  delete 'session/signout', to: 'devise/sessions#destroy', as: :signout
  get ':username', to: 'users#show', as: :profile
  get ':username/edit', to: 'users#edit', as: :edit_profile
  post "users/:username", to: 'users#update', as: :update_profile


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
end
