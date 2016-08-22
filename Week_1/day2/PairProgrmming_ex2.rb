class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email #call super and ass name and email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      (@hourly_rate * @hours_worked).to_f #returns the hours worked * hourly_rate
    end
end

class SalariedEmployee < Employee
    # attr_accessor
    def initialize(name, email, salary)
        @name = name
        @email = email
        @salary = salary
    end

    def calculate_salary
      (@salary/52).to_f
    end
end

class MultiPaymentEmployee < Employee
    attr_accessor
    def initialize(name, email, base_salary,hourly_rate,hours_worked)
        @name = name
        @email = email
        @base_salary = base_salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
        if @hours_worked > 40
            (@base_salary/52 + (@hourly_rate * (@hours_worked-40))).to_f
        else
            (@base_salary/52).to_f
        end
    end
end


employees = [
    josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50),
    nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000),
    ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55),
    jason = HourlyEmployee.new('Jason', 'jasonemail@email.com',15,40),
    sophia = HourlyEmployee.new('Sophia','sophiaemail@email.com',15,40)
]

class Payroll
    attr_accessor
    def initialize(employees)
        @employees = employees
    end

    def notify_employee(employee)
            puts "To #{employee.email} You have just been paid!"
    end

    def pay_employees()
        total = 0
        @employees.each do |employee|
            total += employee.calculate_salary
            puts "#{employee.name} => #{((employee.calculate_salary) * (1-0.18)).round(2)}"
        end
        puts total
    end
end

payroll = Payroll.new(employees)
payroll.pay_employees

payroll.notify_employee(jason)
