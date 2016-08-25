require 'sinatra'
require 'pry'
require_relative 'lib/Blog.rb'
require_relative 'lib/Post.rb'

blog = Blog.new
post1 = Post.new("First post","I am such a good blogger already I am such a good blogger already I am such a good blogger already I am such a good blogger already I am such a good blogger already I am such a good blogger already I am such a good blogger already I am such a good blogger already I am such a good blogger already I am such a good blogger already","Dr Seuss","Food")
post2 = Post.new("Second post","Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools Let me enlighten you fools","Dr Frankenstein","Science")
blog.add_post(post1)
blog.add_post(post2)
blog.sort_by_latest


get '/' do
  @blog = blog
  erb(:home)
end

get '/post_details/?:post_index?' do
  @blog = blog
  @post_index = params[:post_index].to_i
  erb(:post_details)
end

post '/submit_post' do
  redirect('/new_post')
end

get '/new_post' do
  erb(:new_post)
end

post '/save_new_post' do
  title = params[:title]
  text = params[:text]
  author = params[:author]
  category = params[:category]
  blog.add_post(Post.new(title, text, author, category))
  blog.sort_by_latest
  redirect to "/"
end
