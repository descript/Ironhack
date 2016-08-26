require 'pry'
require 'imdb'

class AnalyzeAnswer

  def initialize(movielist)
    @movielist = movielist
  end

  def sort_by_category_and_order(category,order) #rating, year, length, votes
    if order.downcase == "asc"
      case category
        when "rating"
          @movielist.sort {|movie1, movie2| movie1.rating <=> movie2.rating }
        when "year"
          @movielist.sort {|movie1, movie2| movie1.year <=> movie2.year }
        when "length"
          @movielist.sort {|movie1, movie2| movie1.length <=> movie2.length }
        when "votes"
          @movielist.sort {|movie1, movie2| movie1.votes <=> movie2.votes }
      end #end case
    elsif order.downcase == "desc"
      case category
        when "rating"
          @movielist.sort {|movie1, movie2| movie2.rating <=> movie1.rating }
        when "year"
          @movielist.sort {|movie1, movie2| movie2.year <=> movie1.year }
        when "length"
          @movielist.sort {|movie1, movie2| movie2.length <=> movie1.length }
        when "votes"
          @movielist.sort {|movie1, movie2| movie2.votes <=> movie1.votes }
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
