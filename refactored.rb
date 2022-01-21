require './school-library/student'
require './school-library/rental'
require './school-library/persons'
require './school-library/teacher'

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

  def input_age; end

  def input_name; end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_option = Integer(gets.chomp)
    case person_option
    when 1
      print 'Age: '
      age = gets.chomp.to_i

      print 'Name: '
      name = gets.chomp

      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.to_s.upcase

      case permission
      when 'Y'
        permission = true
      when 'N'
        permission = false
      end
      student = Student.new(age: age, name: name, parent_permission: permission)
      @people.push(student)

      puts 'Person created successfully!'
      puts "\n"
    when 2
      print 'Age: '
      age = gets.chomp.to_i

      print 'Name: '
      name = gets.chomp

      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teachers.new(age: age, name: name, specialization: specialization)
      @people.push(teacher)

      puts 'Person created successfully!'
      puts "\n"
    else
      puts 'Person not created.'
    end
  end

  def people_list
    puts "\n\nNo person is added yet, add someone!" if @people.empty?

    @people.each do |person|
      person.correct_name
      puts "[#{person.class.name}] Name: #{person.name}, id:#{person.id}, Age: #{person.age}\n"
    end
  end

  def person_rent
    @person_array.each_with_index do |person, index|
      puts("#{index} #{person}")
    end
  end
end
