Rails.application.routes.draw do
  
  root 'home#index'

  get    "/auth/:provider/callback" => "auth#callback"
  get    "/auth/failure" => "auth#failure"
  delete "/auth/destroy" => "auth#destroy", as: "destroy_user_session"
  
  get 'index', to: 'static_pages#index'
  get 'about', to: 'static_pages#about'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  resources :users do
    resources :pups
    resources :offers
    get 'upcoming_walks'
  end

  resources :walks
  resources :visitor_messages, only: [:new, :create]

end