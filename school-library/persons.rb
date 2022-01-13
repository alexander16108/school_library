require './corrector'
require './rentals'

class Person
  attr_reader :id, :parent_permission, :rental
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def _is_of_age?
    return true if @age >= 18

    false
  end

  def corrector_name
    correct = Corrector.new
    @corrector_name = correct.corrector_name(@corrector_name)
  end

  def validate_name
    return true if corrector_name == 10
  end

  def can_use_services?
    return true if _is_of_age? || @parent_permission

    false
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.person = self
  end
end
