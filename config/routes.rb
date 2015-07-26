Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    resources :sign_ups
    resources :cars
    resources :schedules
  end
end
