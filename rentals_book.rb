require_relative './book_list'
require_relative './refactored'
require_relative './school-library/rental'

class Rents
  def initialize(books, rentals)
    @books = books
    rental_file = './rentals.json'
    f = File.read(rental_file)
    if f.empty? == false
      json = JSON.parse(f)
      @rental_array = []
      @rental_array.push(json)
    else
      @rental_array = []
    end
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.rent_book
    book_selected = Integer(gets.chomp)
    book_chosen = @books.book_list[book_selected]
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
    id = gets.chomp.to_i

    desired_rentals = @rental_array.find { |rental| rental.person.id == id }

    if desired_rentals.empty?
      puts 'No book rented for this person.'
    else
      puts 'Rentals: '
      desired_rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
      puts
    end
  end
end
