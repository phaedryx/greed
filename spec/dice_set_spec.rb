require 'minitest/spec'
require 'minitest/autorun'
require 'dice_set'


describe DiceSet do
  
  before do
    @dice_set = DiceSet.new
  end
  
  it "must create a dice set"  do 
    @dice_set.wont_be_nil
  end


  describe "#roll" do
    # ROLL METHOD TESTS HERE
    it "must return a set of dice rolls" do
      @dice_set.roll.must_be_kind_of(Array)
    end

    it "must have dice values between 1 and 6 inclusively" do
      @dice_set.roll.select {|die| die < 1 || die > 6 }.must_be_empty
    end

    it "must default to 5 dice" do
      @dice_set.roll.size.must_equal 5
    end
  end

<<<<<<< HEAD

  describe "#score" do
    # SCORE METHOD TESTS HERE
  end


  describe "#value" do
    # VALUE METHOD TESTS HERE
  end

end
=======
  describe "#values" do
    before do 
      @dice_set.roll
    end

    it "must have dice values between 1 and 6 inclusively" do
      @dice_set.roll.select {|die| die < 1 || die > 6}.must_be_empty
    end
  end
end

>>>>>>> master
