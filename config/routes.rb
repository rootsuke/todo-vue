Rails.application.routes.draw do
  root 'home#index'

  namespace :api, format: :json do
    resources :tasks, only: %i(index create update)
  end
end
