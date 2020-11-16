Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auditions, only: [:create, :show, :update]
        # get 'auditions/actor/[:id]', to: 'auditions#actor_auditions'
      resources :roles
      resources :gigs
      resources :casting_directors, only: [:create, :show]
        post 'casting_directors/login', to: 'auth#create_casting_director'
        get "casting_directors/auditions/:id", to: 'casting_directors#auditions'
        get 'users/profile', to: 'casting_directors#profile'
      resources :actors, only: [:create, :show]
        post 'actors/login', to: 'auth#create_actor'
        get "actors/auditions/:id", to: 'actors#auditions'
        get 'actors/profile', to: 'actors#profile'
    end
  end
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
