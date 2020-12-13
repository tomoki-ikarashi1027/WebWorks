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
    resources :prefectures,only: [:index, :show, :create ]
    get 'contacts/top' => "contacts#top"
    resources :contacts
    resources :companies do
      resources :post_comments
    end
  end

  root to: 'contacts#top'
  get "prefectures/search" => "prefectures#search"
  resources :contacts
  resources :prefectures, only: [:index, :show]
  resources :companies do
    resources :post_comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
