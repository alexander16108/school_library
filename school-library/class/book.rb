class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title:, author:)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental
    @rentals.push(rental)
    rental.book = self
  end

  def to_json(*_args)
    JSON.dump({
                title: @title,
                author: @author.to_json
              })
  end
end
