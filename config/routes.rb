Rails.application.routes.draw do
  resources :bookings
  resources :cleaners
  resources :customers
  resources :cities
  post '/' => 'home#do_book'
  root 'home#create_booking'
end
