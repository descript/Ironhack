class TextInspectionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @text = params[:text_inspection][:user_text]
    word_array = @text.split(' ')
    @word_count = word_array.length  #add each word to a ahsh. if it exists increment 1 otherwise add

    hash = {}
    word_array.each do |word|
      if hash[word] == nil
        hash[word] = 1
      else
        hash[word] +=1
      end
    end
    @word_frequency = hash

    @top_10 = hash.sort_by {|k,v| -v}.first(10)  
    render 'results'
  end
end
