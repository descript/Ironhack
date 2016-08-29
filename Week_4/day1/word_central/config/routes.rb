Rails.application.routes.draw do
  root "site#home"
  get '/text_inspections/new', to: "text_inspections#new"
  post "/text_inspections", to: "text_inspections#create"
  get "/results", to: "text_inspections#results"
  get "/ascii/new", to: "ascii#new"
  post "/ascii", to: "ascii#create"
end
