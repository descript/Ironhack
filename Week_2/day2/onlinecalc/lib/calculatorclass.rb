
class Calculator
  def add(num1,num2)
    num1.to_f+num2.to_f
  end

  def subtract(num1,num2)
    num1.to_f-num2.to_f
  end

  def multiply(num1,num2)
    num1.to_f*num2.to_f
  end

  def divide(num1,num2)
    if num2.to_f == 0.0
      0
    else
      num1.to_f/num2.to_f
    end
  end
end
