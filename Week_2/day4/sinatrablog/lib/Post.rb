require 'pry'

class Post
  attr_reader :title, :text, :date
  def initialize(title, text)
    @title = title
    @text = text
    @date = Time.now
  end

  def show_title
    @title
  end

  def show_text
    @text
  end

  def show_date
    @date
  end

end
