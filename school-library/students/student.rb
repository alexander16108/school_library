require "../person/persons.rb"

class Student < Animal
def initialize(classroom)
  @classroom = classroom
end
  def play_hooky
  return "¯\(ツ)/¯"
  end
end