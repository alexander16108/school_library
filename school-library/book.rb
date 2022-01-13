class Book
  attr_reader :rental, :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end
end
