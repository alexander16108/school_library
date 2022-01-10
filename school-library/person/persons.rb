class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', _parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if @age >= 18 || parent_permission

    false
  end
end
