Rails.application.routes.draw do
  namespace :v1, defaults: {format: :json} do

    resources :password, only: [:new]
    resources :users, only: [:create]
    patch 'users' => 'users#update'
    get 'users' => 'users#show'

    delete 'authentication' => 'authentication#destroy'
    post 'authentication/generate_otp' =>'authentication#generate_otp'
    resources :authentication, only: [:create, :update]
    
    namespace :admin do

      resources :authentication, only: [:create, :update]
      resources :password, only: [:new]
      resources :admin_users
      
      resources :users, except: [:new, :edit]
    end
  end
end
