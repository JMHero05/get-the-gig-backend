Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :auditions
      resources :roles
      resources :gigs
      resources :casting_directors
      resources :actors
    end
  end
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
