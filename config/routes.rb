Rails.application.routes.draw do
  devise_for :users, controllers: {confirmations: "confirmations"}

  ### USERS ###
  authenticate :user do
    resources :users, only: [] do
      collection do
        get :stop_impersonating
      end
    end
    resources :accounts do
      collection do
        get :current
      end
    end
  end

  ### ADMIN ###
  authenticate :user, lambda { |u| u.admin? } do
    namespace :admin do
      require "sidekiq/web"
      require "sidekiq-scheduler/web"
      mount Sidekiq::Web => "/sidekiq"

      resources :users, except: [:show] do
        member do
          get :impersonate
        end
      end
      resource :dashboard, only: [:show], controller: "dashboard"
    end
  end

  ### DEVELOPER ###
  authenticate :user, lambda { |u| u.developer? } do
    namespace :developer do
      resources :api_tokens
    end
    apipie
  end

  #### API ####
  namespace :api do
    get "status", to: "api#status"
    api_version(
      module: "V1",
      header: {name: "Accept", value: "application/api.rails-starter-7.com; version=1"},
      path: {value: "v1"},
      default: true
    ) do
      resource :auth, only: [:create]
      resource :me, controller: :me
    end
  end

  ### SYSTEM ###
  get "/status", to: "health#status"

  devise_scope :user do
    authenticated :user do
      root to: "accounts#current", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
