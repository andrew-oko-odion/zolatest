Rails.application.routes.draw do
  root 'countries#index'
  mount Swaggard::Engine, at: '/api_docs/swagger/'
  namespace :api do
    namespace :v1 do
      resources :countries, only: [:index, :show]
    end
  end
end
