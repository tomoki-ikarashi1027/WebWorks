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
    resources :companies

    get 'homes/top' => "homes#top"
  end

  root to: 'homes#top'
  resources :companies, only: [:index, :show ,:create]
  resources :prefectures, only: [:index, :show] do
    resources :companies
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
