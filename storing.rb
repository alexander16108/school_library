require_relative '../school-library/persons'
require_relative '../school-library/book'
require_relative '../school-library/classroom'
require_relative '../school-library/student'
require_relative '../school-library/rental'
require_relative '../school-library/teacher'
require 'json'

class Storing
    def initialize(books, people, rentals)
      @books = books
      @people = people
      @rentals = rentals
    end
    
def from_people_to_json
  people_json = []
  @people.each do |person|
    people_json.push(person.to_json)
  end
  people_json = json.dump({ 
  people : people_json
   })
   File.write("people.json", people_json)
end

def from_json_to_people(people)
  people_data = JSON.parse(people)['people']
  return if people_data == []

  people_data.each do |object|
    file = JSON.parse(object)

    student = Student.new(age: file['age'], name: file['name'], parent_permission: file['parent_permission'])
    teacher = Teacher.new(age: file['age'], name: file['name'], specialization: file['specialization'])

    if file['classname'] == 'Student' && file
      @people.push(student)
    else
      @people.push(teacher)
    end
  end
end
  
    def store_data
      data = []
      data.push(@books.to_json)
      send = JSON.dump(data)
      if !File.exist?("./book.json")
        File.new("./book.json", "w+")
      end
      File.write("./book.json", data)
    end
end

# @books.each do |book|
#     data.push(book)
#   end



# books = [{"Title"=>"My title", "Author"=>"My author"}]
# File.open("books.json", "w") { |f| f.puts books.to_json }