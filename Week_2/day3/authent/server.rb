require 'sinatra'
require 'pry'

@users = {"Jason"=>"1234","Frankenstein"=>"9876"}
enable(:sessions)


get '/' do
  '<h1>Home Page.</h1>'
  if session[:username] == nil
    erb(:home)
  else
    erb(:profile)
  end
end

post '/existing' do
  redirect('/login')
end

post '/register_user' do
  # @username = params[:username]
  # @password = params[:password]
  users[:username] = :password
  session[:username] = :password
  erb(:profile)
end

post '/register' do
  erb(:register)
end

get '/login' do
  erb(:login)
end

post '/receiveing_info' do
  @username = params[:username]
  @password = params[:password]
  if users.key(@password) == @username
    session[:username] = @username
    session[:password] = @password
    erb(:profile)
  else
    erb(:no_user)
  end
end

post '/log_out' do
  session[:username] = nil
  session[:password] = nil
  session[:jimmy] = nil
  redirect('/')
end
