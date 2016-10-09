require 'sidekiq/web'

Rails.application.routes.draw do
  filter :locale

  root 'main#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  delete 'sign_out', to: 'dashboard/user_sessions#destroy', as: 'logout'

  mount Sidekiq::Web, at: '/sidekiq'

  scope module: 'home' do
    resources :user_sessions, only: [:new, :create]
    resources :users, only: [:new, :create]
    get 'login' => 'user_sessions#new', :as => :login
    post 'oauth/callback' => 'oauths#callback'
    get 'oauth/callback' => 'oauths#callback'
    get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
  end

  scope module: 'dashboard' do
    resources :user_sessions, only: :destroy
    resources :users, only: :destroy
    put "find_flickr"        => "cards#find_flickr"
    post 'logout' => 'user_sessions#destroy', :as => :logout_user
    put 'review_card' => 'trainer#review_card'
    get 'trainer' => 'trainer#index'

    get 'profile/:id/edit' => 'profile#edit', as: :edit_profile
    put 'profile/:id' => 'profile#update', as: :profile

    get 'statistics' => 'statistics#index', as: :statistics

    resources :cards
    resources :parse_cards, only: [:new, :create]
    resources :blocks do
      member do
        put 'set_as_current'
        put 'reset_as_current'
      end
    end
  end
end
