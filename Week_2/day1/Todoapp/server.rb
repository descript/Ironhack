require 'sinatra'
require 'pry'
# require 'sinatra/reloader'
require 'bundler/setup'
# We're going to need to require our class files
require_relative 'lib/sinatraTODO.rb'

todo_list = TodoList.new("jason")
todo_list.load_tasks

get '/' do
  redirect('/tasks')
end

get '/tasks' do
  @tasklist = todo_list.get_tasks
  erb(:task_index)
end

get '/new_task' do
  erb(:new_task)
end

post '/create_task' do
  @new_task = params[:new_task]
  task = Task.new(@new_task)
  todo_list.add_task(task)
  binding.pry
  # todo_list.save
  redirect('/tasks')
end
