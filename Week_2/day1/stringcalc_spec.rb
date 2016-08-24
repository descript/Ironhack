require_relative 'string_calc.rb'

RSpec.describe "My Calc" do
  it 'returns 0 when I input an empty string' do
    my_expectation = StringCalc.new.add('')
    expect(my_expectation).to eq(0)
  end

  it 'outputs 1 when i input a string 1' do
    my_expectation = StringCalc.new.add('1')
    expect(my_expectation).to eq(1)
  end

  it "outputs 14 when i input a string 1\n5\n8" do
    my_expectation = StringCalc.new.add("1\n5\n8")
    expect(my_expectation).to eq(14)
  end

end
