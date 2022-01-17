require_relative './persons'

class Student < Person
  attr_reader :classroom

  def initialize(*args, classroom: 'Unknown', **kargs)
    super(*args, **kargs)
    @classroom = classroom
  end

  def classroom=(classroom)
    classroom.rental.push(self) unless classroom.rental.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
