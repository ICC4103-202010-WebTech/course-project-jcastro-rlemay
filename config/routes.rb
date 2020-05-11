Rails.application.routes.draw do
  root "pages#home"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :inboxes, shallow: true
      end
      resources :events do
        resources :comments
      end
      resources :organizations
    end
  end

  get "/terms", to: "pages#terms", as: "terms"
  resources :users, defaults: { format: :html } do
    resources :inboxes, defaults: { format: :html }, shallow: true
    resources :organizations, defaults: { format: :html }
    resources :events, defaults: { format: :html }
  end
  resources :comments, defaults: { format: :html }
  resources :events, defaults: { format: :html } do
    resources :polls, defaults: { format: :html }, shallow: true
  end
  resources :organizations, defaults: { format: :html } do
    resources :events, defaults: { format: :html }
  end
end
