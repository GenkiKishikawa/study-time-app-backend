Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: [:index]
      end

      put 'users/upload_image', to: 'users#upload_image'
      get 'users/show', to: 'users#show'

      resources :records
      resources :monthly_time, only: [:index]
      resources :daily_time, only: [:index]
      resources :categories
      resources :sub_categories
    end
  end
end
