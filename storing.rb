require './school-library/persons'
require './school-library/book'
require './school-library/classroom'
require './school-library/student'
require './school-library/rental'
require './school-library/teacher'
require 'pry'
require 'json'

module Storing
  def from_json(books: nill, person: nill, rentals: nill)
    from_json_to_person(person) if person
    from_json_to_book(books) if books
    from_json_to_rental(rental) if rentals
  end

  def from_person_to_json
    person_json = []
    @person.each do |person|
      person_json.push(person.to_json)
    end

    person_json = JSON.dump({
                              person: person_json
                            })

    File.write('person.json', person_json)
  end

  def from_json_to_person(person)
    person_data = JSON.parse(person)['person']
    return if person_data == []

    person_data.each do |object|
      file = JSON.parse(object)

      student = Student.new(age: file['age'], name: file['name'], parent_permission: file['parent_permission'])
      teacher = Teacher.new(age: file['age'], name: file['name'], specialization: file['specialization'])

      if file['classname'] == 'Student' && file
        @person.push(student)
      else
        @person.push(teacher)
      end
    end
  end

  def from_json_to_rentals(rentals)
    rentals_data = JSON.parse(rentals)['rentals']
    return if rentals_data == []

    rentals_data.each do |object|
      json_object = JSON.parse(object)
      rental = Rental.new(date: json_object['date'], person: @person[person_index_lookup(json_object)],
                          book: @books[book_index_lookup(json_object)])

      @rentals.push(rental) if json_object
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def person_index_lookup(object)
    object = JSON.parse(object['person'])

    if object['classname'] == 'Teacher'
      @people.each_with_index do |person, index|
        if object['classname'] == person.class.to_s &&
           object['name'] == person.name && object['age'] == person.age &&
           object['specialization'] == person.specialization
          return index
        end
      end
    else
      @people.each_with_index do |person, index|
        if object['age'] == person.age &&
           object['name'] == person.name &&
           object['parent_permission'] == person.parent_permission &&
           object['classname'] == person.class.to_s
          return index
        end
      end
    end
  end

  def book_index_lookup(object)
    object = JSON.parse(object['book'])
    @books.each_with_index do |book, index|
      return index if object['title'] == book.title and object['author'] == book.author
    end
  end
  #   def store_data
  #     data = []
  #     @books.list_book.each do |book|
  #      data.push(book.to_json)
  #     end
  #     send = JSON.dump(data)
  #     if !File.exist?("./book.json")
  #       File.new("./book.json", "w+")
  #     end
  #   end
  # end

  # def store_data
  #   data = []
  #   data.push(@books.to_json)
  #   send = JSON.dump(data)
  #   File.new('./book.json', 'w+') unless File.exist?('./book.json')
  #   File.write('./book.json', data)
  # end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
