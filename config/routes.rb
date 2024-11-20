require 'sidekiq/web'

Rails.application.routes.draw do
  # Devise routes first
  devise_for :users
  
  # Mount Sidekiq Web UI for admins after Devise routes
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  resources :fish
  get 'fish/index'
  
  # Set root to the home#index action
  root to: 'home#index'
end

