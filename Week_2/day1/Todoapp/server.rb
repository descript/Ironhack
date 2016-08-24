require 'sinatra'
require 'sinatra/reloader'
# We're going to need to require our class files
require_relative('lib/sinatraTODO.rb')

todo_list = TodoList.new("Josh")
todo_list.load_tasks

get '/' do
  '<h1> Welcome to the To Do List </h1>'
  todo_list.tasks
end
