Rails.application.routes.draw do

  get 'static_pages/about'

  get 'static_pages/home'

  get 'static_pages/admin'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: "posts#index"
  resources :events
  resources :posts
  resources :media
  resources :performers
  
end
