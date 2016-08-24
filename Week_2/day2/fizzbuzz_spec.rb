require_relative 'fizzbuzz.rb'

RSpec.describe FizzBuzz do
  before :each do
    @fzbz = FizzBuzz.new
  end

  describe "#div by 5" do
    it "if number div by 5, print Buzz" do
      expect(@fzbz.calc(20)).to eq("Buzz")
    end
  end

  describe "#div by 3" do
    it "if number div by 3, print Fizz" do
      expect(@fzbz.calc(21)).to eq("Fizz")
    end
  end

  describe "#div by 15" do
    it "if number div by 5, print Bang!" do
      expect(@fzbz.calc(60)).to eq("FizzBuzz")
    end
  end

  describe "#prime number" do
    it "if number is prime, print the number" do
      expect(@fzbz.calc(15)).to eq("Bang!")
    end
  end

  describe "#prime number" do
    it "if number is prime, print the number" do
      expect(@fzbz.calc(19)).to eq("Bang!")
    end
  end

  describe "#non-prime number but not div by 3 or 5" do
    it "if number is prime, print the number" do
      expect(@fzbz.calc(26)).to eq("26")
    end
  end

  describe "#bang scenario" do
    it "if number starts with 1, also print Bang!" do
      expect(@fzbz.calc(16)).to eq("Bang!")
    end
  end

end
