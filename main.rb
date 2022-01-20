require './refactored'
require './rentals_book'
require './book_list'
require './storing'

class App
  def self.home_page
    puts 'Welcome to the OOP School Library App!'
    puts "\n"
    puts 'Please choose an option by entering a number: '

    @content = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
    @content.each do |index, string|
      puts "#{index} - #{string}"
    end
    Integer(gets.chomp)
  end

  method = Methods.new
  books = BooksList.new
  rent = Rents.new(books, method)
  store = Storing.new(books, method, rent)

  loop do
    case home_page
    when 1
      books.book_list
    when 2
      method.people_list
    when 3
      method.create_person
    when 4
      books.create_book
    when 5
      rent.create_rental
    when 6
      rent.rental_list
    when 7
        store.store_books
        store.store_persons
      puts 'Thank you for using the app!'
      exit
    else
      puts 'Choose a number between 1 to 7'
    end
  end
end

def main
  app = App.new
  app.load_data
end

main

# def load_data
#   if File.exist?('book.json')
#     books = File.read 'book.json'
#     from_file(books: books)
#   end

#   if File.exist?('people.json')
#     people = File.read 'people.json'
#     from_file(person: person)
#   end

#   return unless File.exist?('rental.json') && File.exist?('people.json') && File.exist?('books.json')

#   rentals = File.read 'rental.json'
#   from_file(rentals: rentals)
# end