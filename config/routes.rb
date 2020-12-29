Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :restaurants
  resources :categories

  resources :search, only: :create

  authenticated :admin do
    root 'admin_dashboards#index', as: :authenticated_admin
  end

  root 'pages#index'
end
