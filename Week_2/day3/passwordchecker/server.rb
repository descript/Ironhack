require 'sinatra'
require 'pry'
require_relative 'lib/password.rb'

enable(:sessions)

get '/' do
    erb(:home)
end

post '/login' do
    pwchkr = PasswordChecker.new
    @email = params[:email]
    @password = params[:password]
    if pwchkr.check_password(@email,@password)
        redirect('/congratulations')
    else
        redirect('/')
    end
end

get '/congratulations' do
    erb(:congrats)
end
