Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get "dashboard", to: "dashboard#index", as: :dashboard
  get "up", to: "rails/health#show", as: :rails_health_check
end
