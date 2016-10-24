Rails.application.routes.draw do
  resources :food_items do
    resources :orders
  end

  resources :users do
    collection do
      get :friends
      get :inverse_friends
      get :friends_by_all_mean
    end
    
    resources :messages
  end

  resources :messages do
    collection do
      get :sent
      get :received
    end
  end

  resources :friendships

  resources :sessions, only: [:new, :create]

  get 'sites/about'
  get 'users/index'
  #get '/food_items/type/breakfast', to: 'foot_items#breakfast'
 
  root "home#index"
  #get 'home/index'

  delete '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
