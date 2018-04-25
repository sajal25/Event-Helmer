Rails.application.routes.draw do
  devise_for :event_organizers, {
    sessions: 'event_organizers/sessions',
    confirmations:'event_organizers/confirmations',
    passwords:'event_organizers/passwords',
    registrations:'event_organizers/registrations',
    unlocks:'event_organizers/unlocks'
  }
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :events do 
    collection do 
      get :search_event_by_location
      get :search_event_by_type
    end
    member do 
      get :get_event_tickets
    end
  end
  # resources :event_organizers
  resources :event_topics
  resources :event_types
  root 'home#index'
  get '/contact-us' => 'home#contact_us'
  get '/organizer/pricing' => 'home#pricing_table'
  get '/payment-process' => 'home#payment_process'
  get '/area-events' => "home#area_events"

  get '/near-by-events' => "home#search_near_by_events"
  get 'home/how_it_works'
  get 'orders/message_confirmation'
  get '/terms-of-services' => 'home#terms_of_services'
  post '/create_contact' => "home#create_contact"

  resources :orders do 
    collection do 
      post :create_order
      delete :delete_order_item
      patch :update_order_item
      get :register_for_event
      post :create_event_registration
      get :checkout_for_event
    end
  end

  namespace :organizer do
    resources :events
  end 

  post 'pricing/create_member_ship'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end