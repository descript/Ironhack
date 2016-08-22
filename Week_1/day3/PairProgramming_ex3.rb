require 'imdb'
require 'pry'

module Graphic

  def format_graphic
      graph = ""

      10.times do |x|
        score = 10-x

        line = ""
        @rating_list.each do |number|
          if number >= score
            line += "|#"
          else
            line += "| "
          end #END if
        end #END do

        graph += line + "|\n"
    end #END do 10.times
    print graph
  end #end method

  def format_bars
    @movie_list.size.times {|a| print "--"}
    print "\n"
  end

  def format_titlekeys
    print "|"
    @movie_list.each_with_index {|a,b| print "#{b+1}|"}
    print "\n \n"
  end

  def format_list
    @movie_list.each_with_index {|a,b| puts "#{b+1}: #{a}"}
  end
end #end module

class Movies
  attr_reader :movie_list, :rating_list
  include Graphic

  def initialize(namefile)
    @namefile = namefile
    @movie_list = IO.readlines(@namefile)
    @rating_list = []
  end
#
  def searchIMDB
    @movie_list.each do |movie|
      mov = Imdb::Search.new(movie)
      @rating_list << mov.movies[0].rating.round
    end #end do
  end #end method
end #end class

mymovie=Movies.new('movies.txt')
mymovie.searchIMDB
mymovie.format_graphic
mymovie.format_bars
mymovie.format_titlekeys
mymovie.format_list
