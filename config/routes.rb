Rails.application.routes.draw do
  mount Swaggard::Engine, at: '/api_docs/swagger'
  root "swaggard/swagger#index"
  namespace :api do
    namespace :v1 do
      resources :countries, only: [:index, :show]
    end
  end
end
