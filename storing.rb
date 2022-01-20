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
      person_json.push(person.to_json)
    end
    send = JSON.dump(person_json)
    File.write('person.json', person_json)
  end

  def store_books
    books_json = []
    @books.list_book.each do |book|
      books_json.push(book.to_json)
    end
    send = JSON.dump(books_json)
    File.write('./book.json', books_json)
  end

  def store_rentals
    rentals_json = []
    @rentals.list_people.each do |rentals|
      rentals_json.push(rentals.to_json)
    end
    rentals_json = JSON.dump({
                              rentals: rentals_json
                            })

    File.write('rentals.json', rentals_json)
  end


end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

# from_json_to_person(person) if person
# from_json_to_book(books) if books
# from_json_to_rental(rental) if rentals

# def from_json_to_person(person)
#   person_data = JSON.parse(person)['person']
#   return if person_data == []

#   person_data.each do |object|
#     file = JSON.parse(object)

#     student = Student.new(age: file['age'], name: file['name'], parent_permission: file['parent_permission'])
#     teacher = Teacher.new(age: file['age'], name: file['name'], specialization: file['specialization'])

#     if file['classname'] == 'Student' && file
#       @person.push(student)
#     else
#       @person.push(teacher)
#     end
#   end
# end

# def from_json_to_rentals(rentals)
#   rentals_data = JSON.parse(rentals)['rentals']
#   return if rentals_data == []

#   rentals_data.each do |object|
#     json_object = JSON.parse(object)
#     rental = Rental.new(date: json_object['date'], person: @person[person_index_lookup(json_object)],
#                         book: @books[book_index_lookup(json_object)])

#     @rentals.push(rental) if json_object
#   end
# end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  # def person_index_lookup(object)
  #   object = JSON.parse(object['person'])

  #   if object['classname'] == 'Teacher'
  #     @people.each_with_index do |person, index|
  #       if object['classname'] == person.class.to_s &&
  #          object['name'] == person.name && object['age'] == person.age &&
  #          object['specialization'] == person.specialization
  #         return index
  #       end
  #     end
  #   else
  #     @people.each_with_index do |person, index|
  #       if object['age'] == person.age &&
  #          object['name'] == person.name &&
  #          object['parent_permission'] == person.parent_permission &&
  #          object['classname'] == person.class.to_s
  #         return index
  #       end
  #     end
  #   end
  # end

  # def book_index_lookup(object)
  #   object = JSON.parse(object['book'])
  #   @books.each_with_index do |book, index|
  #     return index if object['title'] == book.title and object['author'] == book.author
  #   end
  # end
