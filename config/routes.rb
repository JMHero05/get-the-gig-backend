Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auditions
      resources :roles
      resources :gigs
      resources :casting_directors, only: [:create]
        post 'casting_directors/login', to: 'auth#create_casting_director'
        get 'casting_directors/profile', to: 'casting_directors#profile'
      resources :actors, only: [:create]
        post 'actors/login', to: 'auth#create_actor'
        get 'actors/profile', to: 'actors#profile'
    end
  end
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
