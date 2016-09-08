Rails.application.routes.draw do
  # get "/", to: "site#home"
  get "/users", to: "users#show"
  post "/users", to: "users#create"
  get "users/new", to: "users#new"
  get "users/delete", to: "users#delete"
  post "users/destroy", to: "users#destroy"

  get "/products", to: "products#index"

end
