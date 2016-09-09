Rails.application.routes.draw do
  get "/movies", to: "movies#index"
  get "/movies/new", to: "movies#new"
  post "/movies", to: "movies#create"
  get "/movies/show/:search", to: "movies#show"
  get "/movies/discuss/:id", to: "movies#discuss" #first lets make individual pages for each movie upon clicking the link
end


#start a discussion should be a post, and transmit the information that I want.
#it then redirects/renders to the actual discussion page. this page is where we go straight to if the movie is already in the database
