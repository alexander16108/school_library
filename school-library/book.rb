class Book
  attr_reader :rental
  attr_reader :title, :author
  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end
end