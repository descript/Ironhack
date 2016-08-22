require 'date'
require 'colorize'

class Blog
  def initialize
    @bloglist = [] #array should be able to handle pagination
    @post_counter = 0
  end

  def post_to_blog(post)
    @bloglist << post
  end

  def publish_front_page
    @bloglist = @bloglist.sort {|bloglist_1,bloglist_2| bloglist_1.date <=> bloglist_2.date }
    @bloglist.each do |post|
      @post_counter +=1
      post.format_post
    end

    def numberofposts
      @post_counter
    end
  end


end

class Post
  attr_reader :title, :date, :text
  def initialize(title,date,text)
    @title = title
    @date = date
    @text = text
  end

  def format_post
    puts "#{title}\n **************\n #{text}\n----------------\n"
  end
end

class SponsoredPost < Post
  def format_post
    puts "******#{title}******\n **************\n #{text}\n----------------\n".colorize(:yellow)
  end
end



  post1 = Post.new("Barcelona: The city of Dreams", Date.new(2016,8,15),"What an amazing city!....")
  post2 = SponsoredPost.new("I got pickpocketed in the village square today",Date.new(2016,8,16),"Minor setback....")
  post3 = Post.new("My house burned down",Date.new(2016,8,17),"My life is RUINED....")

my_blog = Blog.new

my_blog.post_to_blog(post1)
my_blog.post_to_blog(post3)
my_blog.post_to_blog(post2)

my_blog.publish_front_page
puts my_blog.numberofposts
