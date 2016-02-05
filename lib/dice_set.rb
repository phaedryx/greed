class DiceSet
  
  def initialize
    @values = []
  end

  def roll number=5
    @values = Array.new(number){rand(6) + 1}
  end

  def values
    @values
  end

  def values= new_values
    raise ArgumentError unless new_values.kind_of?(Array)
    
  end

  def score
  end
end
