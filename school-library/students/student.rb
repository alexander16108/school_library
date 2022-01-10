require '../person/persons'

class Student < Animal
  def initialize(classroom)
    super(name, 21, true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
