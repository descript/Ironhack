
module SalaryPay
    def calculate_salary
        (@salary/52).to_f
    end
end

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
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_pay
      (@hourly_rate * @hours_worked).to_f #returns the hours worked * hourly_rate
    end
end

class SalariedEmployee < Employee
    include SalaryPay
    attr_accessor
    def initialize(name, email, salary)
        @name = name
        @email = email
        @salary = salary
    end

    def calculate_pay
      calculate_salary
    end
end

class MultiPaymentEmployee < Employee
    include SalaryPay
    attr_accessor
    def initialize(name, email, salary,hourly_rate,hours_worked)
        @name = name
        @email = email
        @salary = salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_pay
        if @hours_worked > 40
            (calculate_salary + (@hourly_rate * (@hours_worked-40))).to_f
        else
            calculate_salary
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
            total += employee.calculate_pay
            puts "#{employee.name} => #{((employee.calculate_pay) * (1-0.18)).round(2)}"
        end
        puts total
    end
end




payroll = Payroll.new(employees)
payroll.pay_employees
payroll.notify_employee(jason)


puts ted.calculate_pay
