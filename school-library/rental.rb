require_relative './book'

class Rental
  attr_reader :person, :book, :date

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end

  def person=(person)
    person.rental.push(self) unless person.rental.include?(self)
  end

  def book=(book)
    book.rental.push(self) unless book.rental.include?(self)
  end

  def date=(date)
    date.rental.push(self) unless date.rental.include?(self)
  end

  def to_json(*_args)
    JSON.dump({
                date: @date,
                person: @person.to_json,
                book: @book.to_json
              })
  end
end
