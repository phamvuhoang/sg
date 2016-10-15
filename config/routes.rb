Rails.application.routes.draw do
  resources :food_items
  get 'sites/about'
  #get '/food_items/type/breakfast', to: 'foot_items#breakfast'
 
  root "home#index"
  #get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
