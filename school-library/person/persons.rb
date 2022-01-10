class Person
  attr_reader :id, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def _is_of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if _is_of_age? || @parent_permission

    false
  end
end
