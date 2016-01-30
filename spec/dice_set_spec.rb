require 'minitest/spec'
require 'minitest/autorun'
require 'dice_set'

describe DiceSet do
  before do
    @dice_set = DiceSet.new
  end

  it "must create a dice set" do
    @dice_set.wont_be_nil
  end

  describe "#roll" do
    it "must default to 5 dice" do
      @dice_set.roll
      @dice_set.values.size.must_equal 5
    end
  end

  describe "#values" do
    it "must have dice values between 1 and 6 inclusively" do
      @dice_set.values.select {|die| die < 1 || die > 6}.must_be_empty
    end

    it "must be read-only" do
      values1 = @dice_set.values
      @dice_set.values << 0
      values2 = @dice_set.values
      values1.must_equal(values2)
    end

    it "must not change values when calling values subsequent times" do
      values = @dice_set.values
      @dice_set.values
      @dice_set.values
      @dice_set.values.must_equal(values)
    end
  end

  describe "#values=" do
    it "must raise an error when not given an array" do
      ->{ @dice_set.values = {foo: 'bar'} }.must_raise(ArgumentError)
    end

    it "must not allow invalid values" do
      ->{ @dice_set.values = [7] }.must_raise(ArgumentError)
      ->{ @dice_set.values = [0] }.must_raise(ArgumentError)
      ->{ @dice_set.values = [nil] }.must_raise(ArgumentError)
    end

    it "must set the values to the given array values" do
      array = [1,2,3,4,5,6]
      @dice_set.values = array
      @dice_set.values.must_equal(array)
    end

    it "must have dice values between 1 and 6 inclusively" do
      @dice_set.values = [1,2,3,4,5,6]
      @dice_set.values.select {|die| die < 1 || die > 6 }.must_be_empty
    end
  end

  describe "#score" do
    it "must return 0 when there are no dice" do
      @dice_set.values = []
      @dice_set.score.must_equal(0)
    end

    it "must be independent of order" do
      @dice_set.values = [1,2,3,4,5]
      score1 = @dice_set.score
      @dice_set.values = [5,4,3,2,1]
      score2 = @dice_set.score

      score1.must_equal(score2)
    end

    it "must return 100 for a single 1" do
      @dice_set.values = [1]
      @dice_set.score.must_equal(100)
    end

    it "must return 50 for a single 5" do
      @dice_set.values = [5]
      @dice_set.score.must_equal(50)
    end

    it "must return 1000 for three 1's" do
      @dice_set.values = [1,1,1]
      @dice_set.score.must_equal(1000)
    end

    it "must return 600 for three 6's" do
      @dice_set.values = [6,6,6]
      @dice_set.score.must_equal(600)
    end

    it "must return 500 for three 5's" do
      @dice_set.values = [5,5,5]
      @dice_set.score.must_equal(500)
    end

    it "must return 400 for three 4's" do
      @dice_set.values = [4,4,4]
      @dice_set.score.must_equal(400)
    end

    it "must return 300 for three 3's" do
      @dice_set.values = [3,3,3]
      @dice_set.score.must_equal(300)
    end

    it "must return 200 for three 2's" do
      @dice_set.values = [2,2,2]
      @dice_set.score.must_equal(200)
    end
  end
end
