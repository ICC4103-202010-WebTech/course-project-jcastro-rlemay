Rails.application.routes.draw do
  root "pages#home"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :inboxes
      end
      resources :events do
        resources :comments
      end
      resources :organizations
    end
  end

  resources :users, defaults: { format: :html } do
    resources :inboxes, defaults: { format: :html }
  end
  resources :comments, defaults: { format: :html }
  resources :events, defaults: { format: :html }
  resources :organizations, defaults: { format: :html }
end
