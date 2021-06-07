Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names: {
    sign_in: "login", sign_out: "logout", registration: "register" }

  scope "(:locale)", locale: /en|vi/ do
    root "userpages#home"  

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
