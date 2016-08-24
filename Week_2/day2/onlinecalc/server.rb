require 'sinatra'
require_relative 'lib/calculatorclass.rb'

enable(:sessions)

get "/" do
  "Online Calculator"
  erb(:home)
end

post "/session_show" do
  @cookie_id = params[:saved_value]
  session[:new_session] = @cookie_id
  "Your session is: #{session[:new_session]}"
end

get "/session_test/" do

  erb(:cookie)
end

get "/result/:result" do
  @result = params[:result]

  erb(:saved)
end

post "/calculate" do
  calc = Calculator.new
  operation = params["operation"]
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  case operation
    when "addition"
      result = calc.add(first,second)
    when "subtraction"
      result = calc.subtract(first,second)
    when "division"
      result = calc.divide(first,second)
    when "multiplication"
      result = calc.multiply(first,second)
    end
  redirect("/result/#{result}")
  end

post "/saved" do
  result = params[:saved]
  IO.write('lib/results.txt',result)
  "Saved!"
end
