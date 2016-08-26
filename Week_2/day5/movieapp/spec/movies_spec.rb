require_relative '../lib/movies.rb'

RSpec.describe MovieSearch do

movie_search = MovieSearch.new

  describe "#initialize" do
    it "initializes with an empty array" do
      expect(movie_search.movie_list).to eq([])
    end
  end

  describe "#search" do
    it "searchs database and returns array of 9 movies" do
      expect(movie_search.search("Funny").size).to eq(9)
    end
  end

  describe "#show_movie_list" do
    it "returns the movie_list array" do
      expect(movie_search.show_movie_list.class).to eq(Array)
    end
  end

end #end class
