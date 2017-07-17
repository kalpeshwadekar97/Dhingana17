Rails.application.routes.draw do
  namespace :v1, defaults: {format: :json} do

    resources :password, only: [:new]
    resources :users, only: [:create]

    get 'statics/roads' => 'statics#roads'
    get 'statics/wildlife' => 'statics#wildlife'
    get 'statics/spiritual' => 'statics#spiritual'
    get 'statics/history' => 'statics#history'
    get 'statics/beaches' => 'statics#beaches'
    get 'statics/terms_and_conditions' => 'statics#terms_and_conditions'
    get 'statics/contact_us' => 'statics#contact_us'
    get 'statics/payment_numbers' => 'statics#payment_numbers'
    get 'statics/community' => 'statics#community'
    
    resources :statics
    patch 'users' => 'users#update'
    get 'users' => 'users#show'

    delete 'authentication' => 'authentication#destroy'
    resources :authentication, only: [:create, :update]
    resources :statics
    get 'events/latest' => 'events#latest'
    resources :events, only: [:show, :index]
    resources :user_event_registrations, except: [:new, :edit]
    namespace :admin do

      resources :authentication, only: [:create, :update]
      resources :password, only: [:new]
      resources :admin_users
      resources :events, except: [:new, :edit]
      resources :users, except: [:new, :edit]
      resources :user_event_registrations
    end
  end
end
