class DiceSet
  def roll(number=5)
    @values = Array.new(5){rand(6) + 1}
  end


  def score

  end


  def values values
    h = Hash.new(0)
    @values.each {|v| h.store(v, h[v]+1)}
    return h
  end
end