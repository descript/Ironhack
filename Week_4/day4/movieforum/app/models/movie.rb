class Movie < ApplicationRecord

  def search_imdb(search_term)
    Imdb::Search.new(search_term).movies
  end

end
