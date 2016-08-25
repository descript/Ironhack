require_relative 'Post.rb'

class Blog
  def initialize
    @posts = []
  end

  def show_posts
    @posts
  end

  def add_post(post)
    @posts << post
  end

  def sort_by_latest
      @posts.sort! { | post1, post2 | post2.date <=> post1.date }
  end

end#end class
