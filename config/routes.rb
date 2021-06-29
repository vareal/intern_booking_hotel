Rails.application.routes.draw do
  # devise_for :users, path: "auth", path_names: {
  #   sign_in: "login", sign_out: "logout", registration: "register" }

  devise_for :users, controllers: {
    path: "auth", path_names: { sign_out: "logout" },
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  scope module: "api" do
    namespace :v1 do
      get "user_page", to: "userpages#home"
      get "list_city", to: "userpages#list_city"
      get "get_room_form_city", to: "cities#show"
      get "room_belongs_to_city_id", to: "cities#index"
      get "current_user", to: "api#current_user_api"
      get "user_login", to: "api#user_login"
      get "rooms/:id", to: "rooms#show"
      post "orders", to: "orders#create"
      get "filter_order", to: "orders#index"
      get "looking_my_order", to: "search_order#index"
      get "get_coin_in_wallet", to: "wallets#index"
      get "search_room", to: "search_room#index"
    end
  end

  scope "(:locale)", locale: /en|vi/ do
    root "userpages#home"
    resources :cities

    namespace :publisher do
      patch "rooms", to: "rooms#update"
      patch "returned", to: "rooms#returned"
      get "dashboard", to: "publisherpages#index"
      patch "accept_request", to: "booking_requests#update"
      delete "delete_request", to: "booking_requests#destroy"
      get "register", to: "register#new"

      resources :booking_requests
      resources :rooms
      resources :manage_bills
      resources :register
    end

    namespace :admin do
      root "dashboards#index"
      patch "cities", to: "cities#update"
      get "login" ,to: "login#new"
      patch "accept_request", to: "register_requests#update"
      delete "delete_request", to: "register_requests#destroy"
      patch "accept_req_user", to: "publisher_requests#update"
      delete "delete_req_user", to: "publisher_requests#destroy"

      resources :dashboards
      resources :cities
      resources :publisher_requests
      resources :manage_publishers
      resources :register_requests
    end
  end
end
