require_relative './persons'

class Teachers < Person
  attr_accessor :specialization

  def initialize(age, specialization, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
