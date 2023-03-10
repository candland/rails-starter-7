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
