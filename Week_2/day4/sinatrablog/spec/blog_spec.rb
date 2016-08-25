require_relative '../lib/Blog.rb'

RSpec.describe Blog do
  before :each do
    @blog = Blog.new
    @post1 = Post.new("First post","I am such a good blogger already")
    sleep(0.1)
    @post2 = Post.new("Second post","Let me enlighten you fools")
  end

  describe "#add_post" do
    it "checks that 2 posts get added to blog" do
      @blog.add_post(@post1)
      @blog.add_post(@post2)
      expect(@blog.show_posts.size).to eq(2)
    end
  end

  describe "#show_post" do
    it "checks that show_posts calls the array of @posts" do
      @blog.add_post(@post1)
      @blog.add_post(@post2)
      expect(@blog.show_posts[1]).to eq(@post2)
    end
  end

  describe "#sort_by_latest" do
    it "checks that sort method reorders post based on date" do
      @blog.add_post(@post1) #post1 is older and gets added first to the @posts array
      @blog.add_post(@post2)
      # binding.pry
      expect(@blog.show_posts[0].date < @blog.show_posts[1].date).to eq(true)
      @blog.sort_by_latest #SORTING DONE HERE
      expect(@blog.show_posts[0].title).to eq("Second post")
    end
  end


end#end class
