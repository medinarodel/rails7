Rails.application.routes.draw do
  # health check
  get 'up' => 'rails/health#show', as: :rails_health_check

  # root
  root 'dashboard#index'

  # sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
