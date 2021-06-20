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
      get "get_room_form_city", to: "cities#show"
      get "current_user", to: "api#current_user_api"
      get "user_login", to: "api#user_login"
      get "rooms/:id", to: "rooms#show"
      post "orders", to: "orders#create"
    end
  end

  scope "(:locale)", locale: /en|vi/ do
    root "userpages#home"
    resources :cities

    namespace :publisher do
      patch "rooms", to: "rooms#update"
      get "publisher_pages", to: "publisherpages#home"
      patch "accept_request", to: "booking_requests#update"
      delete "delete_request", to: "booking_requests#destroy"

      resources :booking_requests
      resources :rooms
      resources :manage_bills
    end

    namespace :admin do
      root "dashboards#index"
      patch "cities", to: "cities#update"
      get "login" ,to: "login#new"

      resources :dashboards
      resources :cities
      resources :manage_publishers
      resources :register_requests
    end
  end
end
