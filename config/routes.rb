Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests, only: [:index, :show, :new, :create, :edit, :update, :delete] do 
    resources :votes, only: [:new, :create]
  end

  resources :categories, only: [:index, :new, :create, :delete]
  
  resources :users, only: [:new, :create, :destroy]

  # get '/auth/facebook/callback' => 'sessions#create_from_facebook'
  get '/auth/facebook' => 'sessions#create_from_facebook'
  post '/auth/facebook' => 'sessions#create_from_facebook'

  # devise_for :users, controllers: { omniauth_callbacks: '/omniauth_callbacks_test' }
  # devise_scope :admin do
  #   get 'login', to: 'sessions#new', as: :new_user_session
  #   get 'logout', to: 'sessions#destroy', as: :destroy_user_session
  # end

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  get '/auth/google_oauth2' => 'sessions#omniauth'

  match '/auth/facebook/callback' => 'sessions#create_from_facebook', via: [:get, :post]
  # match '/auth/facebook' => 'sessions#create_from_facebook', via: [:get, :post]

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'requests/:id/delete' => 'requests#destroy'
  get 'categories/:id/delete' => 'categories#destroy'

  get 'users/:id/requests' => 'requests#my_requests'
  get 'users/:id/votes' => 'votes#my_votes'
  get '/most_votes' => 'votes#most_votes'

end
