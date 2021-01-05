Rails.application.routes.draw do

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
    resources :contacts, except: [:show]
    resources :language_tags, except: [:show]
    resources :framework_tags, except: [:show]
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
  get "homes/task" => "homes#task"
  get "task_about" => "contacts#task"
  get "task_top" => "contacts#task"
  get "prefectures/search" => "prefectures#search"
  resources :contacts, only: [:new, :create]
  resources :prefectures, only: [:index, :show]
  resources :companies do
    resources :post_comments, except: [:index ,:show]
  end
  resources :events
end
