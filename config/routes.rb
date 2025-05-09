Rails.application.routes.draw do
  resources :creators do
    post :import_assets, on: :member
  end

  namespace :admin do
    get 'earnings', to: 'earnings#index'
  end

  resources :customers do
    resources :purchases, only: [:new, :create]
    get "downloads", on: :member
  end

  root "customers#index"

end
