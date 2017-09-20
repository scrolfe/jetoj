Rails.application.routes.draw do

  get 'static_pages/login'

  get 'static_pages/about'

  get 'static_pages/home'

  get 'static_pages/admin'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: 'posts#index'
  resources :events
  resources :posts
  resources :media
  resources :performers

  get 'admins/new_user' => 'admins#new_user', as: :admins_new_user
  post 'admins/create_user' => 'admins#create_user', as: :admins_create_user
end
