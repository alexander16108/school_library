require '../person/persons'

class Teachers < Person
  def initialize(specialization)
    super(name, 18, true)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
