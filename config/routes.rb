Rails.application.routes.draw do
  root "userpages#home"

  namespace :publisher do
    get "publisher_pages", to: "publisherpages#home"
  end
end
