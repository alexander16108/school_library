require "../person/persons.rb"

class Teachers < Person
  def initialize(specialization)
@specialization = specialization
  end 

  def can_use_service?
    return true
  end
end