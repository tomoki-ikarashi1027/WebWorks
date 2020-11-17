Rails.application.routes.draw do
  devise_for :users
  get 'company/index'
  get 'company/show'
  get 'company/updata'
  get 'company/destroy'
  get 'company/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
end
