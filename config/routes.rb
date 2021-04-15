Rails.application.routes.draw do
  root 'static_pages#index'

  # routes that need to be setup to match React Router routes
  get '/tasks', to: "static_pages#index"

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :create]
    end
  end
end
