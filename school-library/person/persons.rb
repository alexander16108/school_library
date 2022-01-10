class Person
  def initialize(name = "unknown", age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_reader :id

  attr_accessor :name
  attr_accessor :age

  def is_of_age?
    if @age <= 18
      return true
    else
      return false
  end

  def can_use_services?
    if @age <= 18 or parent_permission = true
      return true
    else
      return false
  end
end