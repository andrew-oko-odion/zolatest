Rails.application.routes.draw do
  root 'countries#index'
  namespace :api do
    namespace :v1 do
      resources :countries, only: %I[index show]
    end
  end
end
