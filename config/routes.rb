Rails.application.routes.draw do

  get 'static_pages/login'

  get 'static_pages/about'

  get 'static_pages/home'

  get 'static_pages/admin'

<<<<<<< HEAD
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: "static_pages#home"
=======
  devise_for :users,
    skip: :registrations,
    controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  root to: 'posts#index'
>>>>>>> development
  resources :events
  resources :posts
  resources :media
  resources :performers

<<<<<<< HEAD
=======
  get 'admins/new_user' => 'admins#new_user', as: :admins_new_user
  post 'admins/create_user' => 'admins#create_user', as: :admins_create_user
>>>>>>> development
end
