# require './school-library/persons'
# require './school-library/book'
# require './school-library/classroom'
# require './school-library/student'
# require './school-library/rental'
# require './school-library/teacher'
# require 'pry'
require 'json'

class Storing
  def initialize(books, persons, rentals)
    @books = books
    @persons = persons
    @rentals = rentals
  end

  def store_persons
    person_json = []
    @persons.list_people.each do |person|
      person_json.push(person)
    end
    send = JSON.dump(person_json)
    File.write('person.json', person_json.to_json)
  end

  def store_books
    books_json = []
    @books.list_book.each do |book|
      books_json.push(book)
    end
    send = JSON.dump(books_json)
    File.write('./book.json', books_json.to_json)
  end

  def store_rentals
    rentals_json = []
    @rentals.list_people.each do |rentals|
      rentals_json.push(rentals)
    end
    send = JSON.dump(rentals: rentals_json)

    File.write('rentals.json', rentals_json.to_json)
  end


end
