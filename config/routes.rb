Tickteee::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => "confirm_user"

  resources :projects do
    resources :tickets
  end

  resources :tickets do
    resources :comments
  end

  root :to => "projects#index"

  namespace :admin do
    root :to => "base#index"
    resources :states
    resources :users do
      resources :permissions
    end
  end

  put '/admin/users/:user_id/permissions',
    :to => "admin/permissions#update",
    :as => :update_user_permissions

  resources :files
end
