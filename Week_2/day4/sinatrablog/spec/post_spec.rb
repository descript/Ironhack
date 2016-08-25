require_relative '../lib/Post.rb'

RSpec.describe Post do

  describe "#show_title" do
    it "shows a posts title" do
      post1 = Post.new("The Great One","omg lol roflcopt0r 4lyfe")
      expect(post1.show_title).to eq("The Great One")
    end
  end

  describe "#show_text" do
    it "shows a posts text field" do
      post1 = Post.new("The Great One","omg lol roflcopt0r 4lyfe")
      expect(post1.show_text).to eq("omg lol roflcopt0r 4lyfe")
    end
  end

  describe "#show_date" do
    it "shows a posts date field" do
      post1 = Post.new("The Great One","omg lol roflcopt0r 4lyfe")
      sleep(0.1) #in order to assure the times are different
      post2 = Post.new("Used cars!","bad credit, no credit? no problem! buy buy buy!")
      expect(post1.show_date <=> post2.show_date).to eq(-1)
      expect(post2.show_date <=> post1.show_date).to eq(1)
    end
  end


end#end class
