Rails.application.routes.draw do

  root to: "static_pages#home"
  get 'static_pages/about'
  get 'static_pages/home'

  devise_for :users,
    skip: :registrations,
    controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :events
  resources :posts
  resources :performers

  get 'media/photo' => 'media#photo', as: :media_photo
  get 'media/video' => 'media#video', as: :media_video
  get 'media/audio' => 'media#audio', as: :media_audio
  resources :media, except: [:index, :show]

  get 'admins/new_user' => 'admins#new_user', as: :admins_new_user
  post 'admins/create_user' => 'admins#create_user', as: :admins_create_user
end
