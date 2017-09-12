Rails.application.routes.draw do

  devise_for :users
  root to: "posts#index"
  resources :events
  resources :posts
  resources :media

end
