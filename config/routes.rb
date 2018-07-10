Rails.application.routes.draw do
  get '/' => 'coordinators#home'
  
  get '/registries' => 'registries#index'
  post '/registries' => 'registries#create'
  get '/registries/:registry_id' => 'registries#show'
  post 'registries/:registry_id/add_coordinator' => "registries#add_coordinator"
  patch '/registries/:registry_id/toggle' => 'registries#toggle_open'
  patch '/registries/:registry_id/update_coordinator' => 'registries#update_coordinator'

  post '/login' => 'coordinators#login'
  get '/coordinators' => 'coordinators#index'
  post '/coordinators' => 'coordinators#create'
  get '/coordinators/:coordinator_id' => 'coordinators#show'
  get '/logout' => 'coordinators#logout'

  get '/enrollments/new' => 'enrollments#new'
  post '/enrollments' => 'enrollments#create'
  delete '/registries/:registry_id/participants/:participant_id' => 'enrollments#destroy'

  post '/participants' => 'participants#create'
  get '/participants/new' => 'participants#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
