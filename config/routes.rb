Rails.application.routes.draw do
  namespace :api do
    mount ActionCable.server => '/cable'

    resources :categories, only: [:show, :index]
    resources :subcategories, only: [:show, :index]
    resources :events

    resources :auth, only: :create do
      get 'me', on: :collection
    end
  end
end
