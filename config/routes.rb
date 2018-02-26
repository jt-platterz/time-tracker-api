Rails.application.routes.draw do
  namespace :api do
    # scope module: :api do
      resources :categories, only: [:show, :index]
      resources :subcategories, only: [:show, :index]
      resources :events
    # end
  end
end
