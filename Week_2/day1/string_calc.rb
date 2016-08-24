require 'pry'

class StringCalc
  def add(number)
    if number.is_a?(String)
      array = number.split("\n").select {|elm| elm.size <= 2} #converts str to arr seperated at the commas, then checks that 2digit number or less
      array.reduce(0) {|sum, num| sum + num} #adds each element of the array together
    end#if
  end#method
end#class

# stringtest = StringCalc.new
# puts stringtest.add("5\n4\nkdkdjf,gdf,5,6\n1")
