class Movie < ApplicationRecord

  def search_imdb(search_term)
  end

  def self.save_new_movie_to_db(movie)
    movie_instance = Movie.new(
    :title => movie.title,
    :year => movie.year,
    :poster => movie.poster,
    :plot_synopsis => movie.plot_synopsis
    )
    movie_instance.save

  end

end
