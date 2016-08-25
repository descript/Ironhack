require 'pry'

class Post
  attr_reader :title, :text, :date, :author, :category
  def initialize(title, text, author, category)
    @title = title
    @text = text
    @author = author
    @category = category
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

  def show_author
    @author
  end

  def show_category
    @category
  end

end
