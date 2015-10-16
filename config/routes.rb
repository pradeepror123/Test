Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  namespace :doctors do
    root :to => "dashboard#index"
    get "/new_doctor" => "dashboard#new"
    post "/new_doctor" => "dashboard#create"
    get "/doctor/:id" => "dashboard#edit"
    put "/doctor/:id" => "dashboard#update"
    delete "/doctor/:id" => "dashboard#destroy"

    get "/my_appointments" => "dashboard#appointments"
    get "/edit_appointment/:id" => "dashboard#edit_appointment"
    put "/appointment/:id" => "dashboard#update_appointment"
  end

  namespace :receptionists do
    root :to => "dashboard#index"
    get "/new_appointment" => "dashboard#new"
    post "/new_appointment" => "dashboard#create"
    get "/appointment/:id" => "dashboard#edit"
    put "/appointment/:id" => "dashboard#update"
    delete "/appointment/:id" => "dashboard#destroy"
  end

  namespace :patients do
    root :to => "dashboard#index"
  end
  
  root :to => "sessions#new"

end
