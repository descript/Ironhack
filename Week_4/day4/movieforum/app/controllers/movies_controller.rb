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

    if params[:id].to_i < 1000 #then its in the database
      @movie = Movie.where("id=?","#{params[:id]}")
    else
      @movie = Imdb::Search.new(params[:search]).movies.select {|movie| movie.id=="#{params[:id]}"} #redo a search but selects single mvie based off of ID
      save_new_movie_to_db = Movie.new(
      :title => @movie[0].title,
      :year => @movie[0].year,
      :poster => @movie[0].poster,
      :plot_synopsis => @movie[0].plot_synopsis
      )

      save_new_movie_to_db.save
    end# if
  end# discuss
end
