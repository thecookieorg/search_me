Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :restaurants
  resources :categories

  authenticated :admin do
    root 'admin_dashboards#index', as: :authenticated_admin
  end

  root 'pages#index'
end
