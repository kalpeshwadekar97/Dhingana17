Rails.application.routes.draw do
  namespace :v1, defaults: {format: :json} do

    resources :password, only: [:new]
    resources :users, only: [:create]
    get 'statics/roads' => 'statics#roads'
    get 'statics/places' => 'statics#places'
    resources :statics
    patch 'users' => 'users#update'
    get 'users' => 'users#show'

    delete 'authentication' => 'authentication#destroy'
    resources :authentication, only: [:create, :update]
    resources :statics
    get 'events/latest' => 'events#latest'
    resources :events, only: [:show, :index]
    namespace :admin do

      resources :authentication, only: [:create, :update]
      resources :password, only: [:new]
      resources :admin_users
      resources :events, except: [:new, :edit]
      resources :users, except: [:new, :edit]
    end
  end
end
