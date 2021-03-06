require_relative './book_list'
require './refactored'

class Rents
  def initialize(books, persons)
    @person_array = persons
    @books = books
    @rental_array = []
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.rent_book
    book_selected = Integer(gets.chomp)
    book_chosen = @books.book_list[book_selected][:object]

    puts 'Select a person from the following list by number (not id): '
    @person_array.person_rent
    person_selected = Integer(gets.chomp)
    person_chosen = @person_array.people_list[person_selected][:object]

    print 'Date: '
    rental_date = gets.chomp

    @rental_array.push(Rental.new(rental_date, book_chosen, person_chosen))
  end

  def rental_list
    print 'ID of person: '
    person_id = Integer(gets.chomp)
    puts 'Rental: '

    @rental_array.each do |rental|
      if person_id == rental.person.id
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
