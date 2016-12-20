Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/secret', as: 'rails_admin'
  devise_for :admins
  
  get 'tags/index'

  get 'tags/show'

  root to: "posts#index"

  resources :tags, only: [:index, :show]

  resources :posts do
  	resources :comments
    member do
      get 'like'
    end
  end

  resources :comments do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
