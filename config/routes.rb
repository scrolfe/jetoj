Rails.application.routes.draw do

  root to: "posts#index"
  resources :events
  resources :posts
  resources :media

end
