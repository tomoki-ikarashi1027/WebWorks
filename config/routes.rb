Rails.application.routes.draw do
  get 'notifications/index'
  get 'rooms/show'
  get 'events/index'
  devise_for :users , controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get "prefectures/search" => "prefectures#search"
    resources :prefectures, only: [:index, :show, :create ]
    get 'contacts/top' => "contacts#top"
    resources :contacts, except: :show
    resources :language_tags, except: :show
    resources :framework_tags, except: :show
    resources :companies
    resources :post_comments, only: [:index, :show, :destroy]
  end
  namespace :api, format: 'json' do
    resources :memos, only: [:index, :create, :destroy, :update]
    resources :tasks, only: [:index, :create, :update, :destroy]
  end

  root to: 'homes#top'
  get "homes/about" => "homes#about"
  get "homes/memo" => "homes#memo"
  get "homes/community" => "homes#community"
  get "homes/task" => "homes#task"
  get "task_about" => "contacts#task"
  get "task_top" => "contacts#task"
  get "prefectures/search" => "prefectures#search"
  resources :contacts, only: [:new, :create]
  resources :prefectures, only: [:index, :show]
  resources :companies, only: :show do
    resources :post_comments, except: [:index ,:show]
  end
  resources :events
  resources :users, only: :show
  resources :communities, only: [:index, :show, :create ,:destroy] do
    resource :likes, only: [:create, :destroy]
  end
  resources :chat_rooms, only: [:show, :create ]
  resources :chat_messages, only: :create
  resources :notifications, only: [:index]
  delete "notifications/destroy_all" => "notifications#destroy_all"

  mount ActionCable.server => '/cable'
end
