require './school-library/persons'
require './school-library/book'
require './school-library/classroom'
require './school-library/student'
require './school-library/rental'
require './school-library/teacher'
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

    File.write('people.json', person_json)
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
