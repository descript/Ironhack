class AsciiController < ApplicationController
  def new
    render "new"
  end

  def create
    wordz = params[:ascii][:user_text]

    a = Artii::Base.new
    @formatted_word = a.asciify(wordz)

    render 'fied'
  end
end
