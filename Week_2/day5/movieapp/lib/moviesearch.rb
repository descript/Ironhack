require 'pry'
require 'imdb'

class MovieSearch
  attr_reader :movie_list

  def initialize
    @movie_list = []
  end

  def search(search_term)
    @movie_list = [] #clears array from previous search results
    @results = Imdb::Search.new(search_term).movies.first(10)
    @results.each do |movie|
      if @movie_list.size >= 9
        break
      else
        unless movie.title.include?("Series") || (movie.poster == nil) #take the results we got, filter out all TV series
          @movie_list <<  movie
        end #unless
      end#if
    end #do
      @movie_list
  end #end method

  def show_movie_list
    @movie_list
  end

end #end method
