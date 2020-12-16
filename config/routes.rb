Rails.application.routes.draw do

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
    resources :prefectures, only: [:index, :show, :create ]
    get 'contacts/top' => "contacts#top"
    resources :contacts, except: [:show]
    resources :tags, except: [:show]
    resources :companies do
      resources :post_comments, only: [:index, :show, :destroy]
    end
  end

  root to: 'contacts#top'
  get "prefectures/search" => "prefectures#search"
  resources :contacts, only: [:new, :create]
  resources :prefectures, only: [:index, :show]
  resources :companies do
    resources :post_comments, except: [:index ,:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
