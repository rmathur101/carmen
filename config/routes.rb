Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
  	# Sign_ups controller
    resources :sign_ups, :only => [:index, :create]

    # Cars controller
    resources :cars, :only => [:index, :show, :create]
   	post '/cars/edit/:id' => 'cars#edit', :as => :edit_car
   	post '/cars/delete/:id' => 'cars#delete', :as => :delete_car

   	# Schedules controller
    resources :schedules, :only => [:index, :show, :create]
    post '/schedules/edit/:id' => 'schedules#edit', :as => :edit_schedule
    post '/schedules/delete/:id' => 'schedules#delete', :as => :delete_schedule

    # Days controller
    resources :days, :only => [:index]

    # Requests controller
    post '/requests' => 'requests#create', :as => :create_request
    post '/requests/cancel' => 'requests#cancel', :as => :cancel_request

    # Profiles controller
    get '/profiles' => 'profiles#index', :as => :get_profile
    post '/profiles/edit' => 'profiles#edit', :as => :edit_profile

    # Settings controller
    post '/settings/change_password' => 'settings#change_password', :as => :change_password
    post '/settings/update' => 'settings#update', :as => :update_settings
    get '/settings' => 'settings#index', :as => :get_settings

    # Garages controller
    resources :garages, :only => [:index]

    # Session controller
    post '/login' => 'session#create', :as => :create_session
    post '/logout' => 'session#delete', :as => :delete_session
  end
end
