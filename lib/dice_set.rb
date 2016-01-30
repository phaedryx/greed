class DiceSet
  def roll(number=5)
    @values = Array.new(number){rand(6) + 1}
  end

  def values
    @values
  end

  def values=(new_values)
  end

  def score
    
  end

  def values

  end

  def score
  end
end
