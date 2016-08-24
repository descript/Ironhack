require 'pry'

class FizzBuzz

  def calc(num)
    if num.to_s[0]=="1"
      "Bang!"
    elsif num%15==0
      "FizzBuzz"
    elsif num%5==0
      "Buzz"
    elsif num%3==0
      "Fizz"
    else
      num.to_s
    end

  end

end
