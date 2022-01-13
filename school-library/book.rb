class Book
  attr_reader :rental, :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental
    @rentals.push(rental)
    rental.book = self
  end
end
