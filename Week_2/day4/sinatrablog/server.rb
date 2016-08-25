require 'sinatra'
require 'pry'
require_relative 'lib/Blog.rb'
require_relative 'lib/Post.rb'

blog = Blog.new
post1 = Post.new("First post","I am such a good blogger already")
post2 = Post.new("Second post","Let me enlighten you fools")
blog.add_post(post1)
blog.add_post(post2)


get '/' do
  # binding.pry
  @blog = blog
  erb(:home)
end

get '/real_page' do
  'The other page'
end

get '/hi' do
  redirect('real_page')
end
