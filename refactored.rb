require_relative './school-library/student'
require_relative './school-library/rental'
require_relative './school-library/persons'
require_relative './school-library/teacher'
require_relative './school-library/book'

def input_age
  print 'Age: '
  gets.chomp
end

def input_name
  print 'Name: '
  gets.chomp
end

class Methods
  def initialize
    person_file = './person.json'
    f = File.read(person_file)
    if f.empty? == false
      json = JSON.parse(f)
      @person_array = []
      @person_array.push(json)
    else
      @person_array = []
    end 
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_option = Integer(gets.chomp)
    case person_option
    when 1
      user_age = input_age
      user_name = input_name

      print 'Has parent permission? [Y/N]: '
      user_permission = gets.chomp.to_s.upcase

      case user_permission
      when 'Y'
        user_permission = true
      when 'N'
        user_permission = false
      end
      student = Student.new(user_age, user_name, parent_permission: user_permission)
      @person_array.push({
                           output: "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}",
                           object: student
                         })

      puts 'Person created successfully!'
      puts "\n"
    when 2
      user_age = input_age
      user_name = input_name

      print 'Specialization: '
      user_specialization = gets.chomp

      teacher = Teachers.new(user_age, user_name, user_specialization)
      @person_array.push("[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}")

      puts 'Person created successfully!'
      puts "\n"
    else
      puts 'Person not created.'
    end
  end

  def people_list
    @person_array.each do |person|
      puts person[:output]
    end
  end

  def list_people
    @person_array.each do |person|
      person[:output]
    end
  end

  def person_rent
    @person_array.each_with_index do |person, index|
      puts "#{index}) #{person[:output]}"
    end
  end
end
