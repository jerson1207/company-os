Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  get "dashboard", to: "dashboard#index", as: :dashboard

  namespace :onboarding do
    resource :company, only: [ :show, :create ]
  end

  get "up", to: "rails/health#show", as: :rails_health_check
end
