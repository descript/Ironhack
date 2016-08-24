require 'sinatra'
require 'artii'

get "/" do
  "ASCII"
end

get "/ascii/:randomword/?:font1?" do
  @word = params[:randomword]
  @font = params[:font1]
  erb(:onerandomword)
end

get "/ascii/cat/special/secret" do
  erb(:special)
end
