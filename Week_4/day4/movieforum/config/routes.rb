Rails.application.routes.draw do
  get "/movies", to: "movies#index"
  get "/movies/new", to: "movies#new"
  post "/movies", to: "movies#create"
  get "/movies/show/:search", to: "movies#show"
  get "/movies/discuss/:id", to: "movies#discuss" #first lets make individual pages for each movie upon clicking the link
end

#get "/movies/discuss/:id/comments/new", to: "comments#new"
#post "/movies/discuss/:id/comments/", to: "comments#create"


#was I supposed to generate the second model as a Belong_to?

#Must figure out how to associate comments with Movies.
