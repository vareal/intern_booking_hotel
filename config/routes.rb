Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names: {
    sign_in: "login", sign_out: "logout", registration: "register" }

  scope module: "api" do
    namespace :v1 do
      get "user_page", to: "userpages#home"
      get "get_room_form_city", to: "cities#show"
      get "current_user", to: "api#current_user_api"
      get "user_login", to: "api#user_login"
      get "rooms/:id", to: "rooms#show"
    end
  end

  scope "(:locale)", locale: /en|vi/ do
    root "userpages#home"
    resources :cities
    namespace :publisher do
      get "publisher_pages", to: "publisherpages#home"
      resources :rooms
    end

    namespace :admin do
      resources :cities
      resources :manage_publishers
    end
  end
end
