class Corrector
  def initialize(correct_name)
    @correct_name = correct_name
  end

  def correct_name
    if @correct_name.length > 10
      correct_name.slice!(10)
    else
      @correct_name.capitalize
    end
  end
end
