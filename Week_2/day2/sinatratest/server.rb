require 'sinatra'

get "/" do
  "My first Sinatra app!."
end

get "/about" do
  erb(:about)
end

get "/user/:username" do
  @username = params[:username]

  erb(:user_profile)
end

get "/hours/ago/:num" do
  @num = params[:num]

  erb(:hours)
end
