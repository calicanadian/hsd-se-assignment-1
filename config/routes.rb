Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :user_photos
    resources :user_riders
  end
  # User Friendships
  post "/users/:id/friends/:friend_id", to: 'users#add_friend', as: 'add_friend'
  delete "/users/:id/friends/:friend_id", to: 'users#remove_friend', as: 'remove_friend'
  # User Riders
  post "/users/:id/riders", to: 'users#add_rider', as: 'add_rider'
  delete "/users/:id/riders/:rider_id", to: 'users#remove_rider', as: 'remove_rider'
  # User Rides
  get "/users/:id/rides", to: 'rides#index', as: "rides"
  get "/users/:id/rides/:ride_id", to: 'rides#show', as: 'ride'
  post "/users/:id/rides", to: 'rides#create'
  patch "/users/:id/rides/:ride_id", to: 'rides#update'
  delete "/users/:id/rides/:ride_id", to: 'rides#destroy'
  
  resources :friendships
  resources :drivers do
    resources :driver_cars
    resources :driver_rides
    resources :driver_photos
  end
  resources :riders do
    resources :rider_rides
  end
  resources :ride_repeaters
  resources :ride_frequencies
  resources :ride_repeater_frequencies
  resources :photos
  resources :reviews
  resources :cars
end
