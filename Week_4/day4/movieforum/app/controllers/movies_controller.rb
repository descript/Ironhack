class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    search = params[:movie][:title]
    redirect_to "/movies/show/#{search}"
  end

  def show #lists all movies
    @query = Movie.where("title LIKE ?", "%#{params[:search]}%")
    if @query.empty?
      @results = Imdb::Search.new(params[:search]).movies.first(5)
    else
      redirect_to "/movies/discuss/#{@query[0].id}"
    end
  end #show

  def discuss
    @query = Movie.where("id=?","#{params[:id]}")
    if @query.empty? #then its in the database
      @movie = Imdb::Search.new(params[:search]).movies.select {|movie| movie.id=="#{params[:id]}"} #redo a search but selects 1 movie based off ID

      Movie.save_new_movie_to_db(@movie[0])
    else
      @movie = Movie.where("id=?","#{params[:id]}")
    end# if
  end# discuss

end
