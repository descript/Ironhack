require 'sinatra'
require 'pry'
# require 'sinatra/reloader'
require 'bundler/setup'
require_relative 'lib/tasks.rb'
require_relative 'lib/todolist.rb'

todo_list = TodoList.new("jason")
todo_list.load_tasks

get '/' do
  redirect('/tasks')
end

get '/tasks' do
  @user = todo_list.user
  @tasklist = todo_list.get_tasks
  erb(:task_index)
end

get '/new_task' do
  erb(:new_task)
end

post '/create_task' do
  task = Task.new(params[:new_task])
  todo_list.add_task(task)
  todo_list.save
  redirect('/tasks')
end

post '/complete_task/:id' do
  id = params[:id].to_i
  todo_list.find_task_by_id(id).complete!
  todo_list.save
  redirect('/tasks')
end

get '/delete' do
  @tasklist = todo_list.get_tasks
  erb(:delete_task)
end

post '/delete_task/:id' do
  id = params[:id].to_i
  todo_list.delete_task(id)
  todo_list.save
  redirect('/tasks')
end
