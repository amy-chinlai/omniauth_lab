Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests, only: [:index, :show, :new, :create, :edit, :update, :delete] do 
    resources :votes, only: [:new, :create]
  end

  resources :categories, only: [:index, :new, :create, :delete]
  
  resources :users, only: [:new, :create, :destroy]

  get '/auth/facebook/callback' => 'sessions#create_from_facebook'

  root to: 'sessions#new'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'requests/:id/delete' => 'requests#destroy'
  get 'categories/:id/delete' => 'categories#destroy'

  get 'users/:id/requests' => 'requests#my_requests'
  get 'users/:id/votes' => 'votes#my_votes'
  get '/most_votes' => 'votes#most_votes'

end
