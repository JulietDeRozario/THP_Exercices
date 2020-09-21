Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/secret'
  devise_for :users
  resources :events
  resources :users, only: [:show, :index] do
    resources :avatars, only: [:create, :destroy, :show]
  end
  resources :charges
  resources :admins
end
