Rails.application.routes.draw do
  devise_for :users

  resources :accounts do
    collection do
      get :current
    end
  end

  devise_scope :user do
    authenticated :user do
      root to: "accounts#current", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
