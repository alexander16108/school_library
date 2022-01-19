require_relative './refactored'
require_relative './rentals_book'
require_relative './book_list'
require_relative './storing'

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
      puts 'Thank you for using the app!'
      store.from_people_to_json
      store.store_data
      exit
    else
      puts 'Choose a number between 1 to 7'
    end
  end
end

def main
  App.new
end

main
