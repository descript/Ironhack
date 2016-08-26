require "sinatra"
require "pry"
require "imdb"
require_relative "lib/moviesearch.rb"
require_relative "lib/analyze.rb"

movie_search = MovieSearch.new
list =  movie_search.show_movie_list
analyze = AnalyzeAnswer.new(list)

questions = {:q1=>["Which movie has the lowest rating?","rating","asc"],
  :q2 =>["Which movie has the lowest rating?","rating","desc"],
  :q3 =>["Which movie is the oldest?","year","asc"],
  :q4 =>["Which movie is the newest?","year","desc"]
}

get '/' do
  erb(:home)
end

post '/search' do
  search_term = params[:search_term]
  movie_search.search(search_term) #search IMDB
  redirect('/results')
end

get '/results' do
  @questions = questions
  @list = movie_search.show_movie_list #sets @list to the array of 9 search results
  erb(:results)
end

post '/answer/?:questionnumber?' do
  @questions = questions
  q_num = params[:questionnumber].to_sym #has to know which randomly generated question you are answering
  category = @questions[q_num][1] #pulls category out of the array
  order = @questions[q_num][2] # pulls desc/asc out of the array

  @newlist = movie_search.sort_by_category_and_order(category,order)
  binding.pry
  movie_search.check_answer(@newlist,params[:answer]) ? redirect('/winner') : (@newlist && erb(:loser))

end

  get '/loser' do
    erb(:loser)
  end

  get '/winner' do
    erb(:winner)
  end
