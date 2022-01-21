require_relative './book_list'
require_relative './refactored'
require_relative './school-library/rental'

class Rents
  def initialize(books, rentals)
    @books = books
    @people = []
    @rentals = rentals
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.rent_book
    book_selected = Integer(gets.chomp)
    book_chosen = @books.list_book[book_selected]
    puts book_chosen

    puts 'Select a person from the following list by number (not id): '
    @people.person_rent
    person_selected = Integer(gets.chomp)
    person_chosen = @people.people_list[person_selected][:object]

    print 'Date: '
    rental_date = gets.chomp

    @rentals.push(Rental.new(rental_date, book_chosen, person_chosen))
  end

  def list_rentals
    @rental_array.each do |book|
      book
    end
  end

  def rental_list
    print 'ID of person: '
    person_id = Integer(gets.chomp)
    desired_rentals = @rentals.select { |rental| rental.person.id == person_id }

    puts 'Rental: '

    @rentals.each do |rental|
      if desired_rentals.empty?
        puts "Date : #{rental.date}, Title: #{rental.book.title}, Author :#{rental.book.author}."
      end
    end
  end
end
