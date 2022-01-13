require './book'

class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person

    @book = book
    book.rental << self
  end

  def person=(person)
    person.rental.push(self) unless person.rental.include?(self)
  end

  def book=(book)
    book.rental.push(self) unless book.rental.include?(self)
  end
end
