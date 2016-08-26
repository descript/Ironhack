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
end

class AnalyzeAnswer

  def sort_by_category_and_order(category,order) #rating, year, length, votes
    if order.downcase == "asc"
      case category
        when "rating"
          @movie_list.sort {|movie1, movie2| movie1.rating <=> movie2.rating }
        when "year"
          @movie_list.sort {|movie1, movie2| movie1.year <=> movie2.year }
        when "length"
          @movie_list.sort {|movie1, movie2| movie1.length <=> movie2.length }
        when "votes"
          @movie_list.sort {|movie1, movie2| movie1.votes <=> movie2.votes }
      end #end case
    elsif order.downcase == "desc"
      case category
        when "rating"
          @movie_list.sort {|movie1, movie2| movie2.rating <=> movie1.rating }
        when "year"
          @movie_list.sort {|movie1, movie2| movie2.year <=> movie1.year }
        when "length"
          @movie_list.sort {|movie1, movie2| movie2.length <=> movie1.length }
        when "votes"
          @movie_list.sort {|movie1, movie2| movie2.votes <=> movie1.votes }
      end #end case
    end#end If
  end#end method


  def check_answer(sorted_list,answer)
    if sorted_list[0].title == answer
      true
    else
      false
    end
  end

end #end class


# moviesrch = MovieSearch.new
# moviesrch.search("basket")
# moviesrch.sort_by_rating
# moviesrch.sort_ascending_by_category("id")
# puts moviesrch.show_movie_list.inspect
