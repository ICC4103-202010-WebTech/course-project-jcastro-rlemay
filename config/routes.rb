Rails.application.routes.draw do
  devise_for :system_admins, controllers: { registrations: 'system_admins/registrations' }
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks'}
  root "pages#home"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :inboxes, shallow: true
      end
      resources :events do
        resources :comments, shallow: true
      end
      resources :organizations
    end
  end

  get "/terms", to: "pages#terms", as: "terms"
  get "/search", to: "pages#search", as: "search"
  post "/events/:id", to: "comments#create", as: "comment"
  post "/users/:id", to: "message#create", as: "new_message"
  resources :users, defaults: { format: :html } do
    resources :inboxes, defaults: { format: :html }, shallow: true
    resources :organizations, defaults: { format: :html }
    resources :events, defaults: { format: :html }
    member do
      post "report", to: "reports#user"
    end
  end
  resources :comments, defaults: { format: :html }
  resources :events, defaults: { format: :html } do
    resources :polls, defaults: { format: :html }, shallow: true
    member do
      get "photos"
      patch "photos"
      get "videos"
      patch "videos"
      get "files"
      patch "files"
      get "invites"
      post "invites"
      post "report", to: "reports#event"
    end
  end
  resources :organizations, defaults: { format: :html } do
    resources :events, defaults: { format: :html }
    member do
      post "report", to: "reports#organization"
      get "invites"
      post "invites"
    end
  end

  namespace :admin do
    root "pages#home"
    post "events/:id", to: "comments#create", as: "new_comment"
    resources :events do
      resources :comments, shallow: true
      member do
        get "invites"
        post "invites"
      end
    end
    resources :organizations do
      member do
        get "invites"
        post "invites"
      end
    end
    resources :comments
  end

end
