require_relative './book'

class Rental
  attr_reader :people, :book, :date

  def initialize(date, book, people)
    @date = date
    @people = people
    @book = book
  end

  def people=(people)
    people.rental.push(self) unless people.rental.include?(self)
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
