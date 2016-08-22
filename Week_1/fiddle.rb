=begin
classmates = ["Steve","Pau","Guy"]

classmates.each do |name|
  puts "Good morning, #{name}"
end

cities = ['miami','madrid','barcelona']

capital_cities = cities.map do |city|
  city.capitalize
end
puts capital_cities

cities = ['miami','madrid','barcelona']
city_size = cities.map do |city|
  city.size
end
# puts cities.size
total_len = city_size.reduce{|sum,x| sum + x}
puts total_len/cities.size

total_lennn = 0
avg_len = cities.each do |city|
  total_lennn = total_lennn + city.size
end
puts avg_len
puts total_lennn

total_len = cities.reduce(0){|sum,city| sum + city.size}
puts total_len/cities.size
=end

# TUESDAY OOP
=begin
class Car
  attr_accessor(:cities)
  def initialize(make,model,year,sound)
    @make=make
    @model=model
    @year=year
    @sound=sound
    @cities = []
  end

  def noise
    puts @sound
  end

  def self.speed_control # Class method called speed_control
    puts "What is the current speed?"
    speed = gets.chomp.to_i
    if speed > 100
      puts "SLOW DOWN!"
    end
  end

  def visit(visited)
    # puts "What new city did you want to add?"
    # visited = gets.chomp
    # IO.write('readwrite.txt',visited)
    open('readwrite.txt', 'a') do |f|
      f << "#{visited}\n"
    end
  end

  def cities
    puts IO.read('readwrite.txt')
  end

end

class RacingCar < Car
  def initialize
    @noise = 'BROOM' #this is an alternate way to do it. we can then delete the new noise method
  end

  def noise
    puts "BROOM"
  end
end

# toy = RacingCar.new("Toyota","Prius","2015","boom")
# volks = Car.new("Volkswagen","Beetle","1969","BOOOOOM")

# toy.visit("Barcelona ")
# toy.visit("Phx")
# toy.cities
# toy.noise

class Person
  attr_reader :name
  attr_accessor :age
  def initialize(name,age)
    @name = name
    @age = age
  end
end

james=Person.new("James",25)
puts "#{james.name} and "
=end

#WEDNESDAY nested data structures
=begin
hash = {
    :wat => [0,1,
        {
            :wut => [0,
            [
                [0,1,2,3,4,5,6,7,8,
                {:bbq => "wtfbbq",
                :barbq => "seventh level"},
            "sixth level"],
                1,
                "fifth level"
            ],
        "fourth level"],
        :wen => "third level"

        },
    "second level"],
    :wat2 => "first level"}

# hash=Hashh.new
p hash[:wat][2][:wut][1][0][9][:bbq]



arr = [[0,1,2,3,4,{:secret => { :unlock => [0,"secretkey"]}}]]

p arr[0][5][:secret][:unlock][1]


class CarDealer
    attr_reader :inventory
    def initialize(inventory)
        @inventory = inventory
    end

    def cars(brand)
        inventory[brand]
    end

    def print_car
        inventory.each do |brand,cars|
            puts "#{brand}:  #{cars.join(', ')}"
        end
    end
end

car_inventory = {"Ford" => ["Fiesta","Mustang"],
    "Honda" => ["Civic","CR-V"] }


car_dealer = CarDealer.new(car_inventory)
# car_dealer.cars("Ford")
# car_dealer.print_car
=end
=begin
class Car
    def initialize(engine)
        @engine = engine
    end

    def noise
        "whoosh " + @engine.make_sound
    end
end

class Engine
    def initialize(enginesound)
        @enginesound = enginesound
    end

    def make_sound
        @enginesound
    end
end

cyl4_engine = Engine.new("pewpew")
v6_engine = Engine.new("bangbang")
v12_engine = Engine.new("BOOOOOM")

my_car = Car.new(cyl4_engine)
your_car = Car.new(v6_engine)
expensive_car = Car.new(v12_engine)
puts my_car.noise
puts your_car.noise
puts expensive_car.noise
=end

#THURSDAY Single Responsibility Principle

#NOW THAT THEY ARE DIFF CLASSES, WE AHVE TO MANUALLY MAKE INSTANCES. BUT THAT DOESNT HELP THE STOPPAGE for failed creds
class User
  attr_reader :username, :password
  def initialize
    puts "Enter your username"
    @username=gets.chomp
    puts "Enter your password"
    @password=gets.chomp
  end
end

class Authenticate
  def initialize(user)
    @user = user
    if @user.username=="admin" && @user.password=="default"
      sess = Session.new
    else
      puts "Incorrect credentials. Your fingers are too fat. To order a typing wand, please mash the keyboard now."
      # break
    end
  end
end


class Session(authentice_class)
  @authentice_class = authentice_class
  attr_accessor :text, :choice
  def initialize
    puts "What is your message?"
    @text = gets.chomp
    puts "Would you like to\nA] Count the words\nB] Count the letters\nC] Reverse the text\nD] Convert to lowercase?\n"
    @choice = gets.chomp.downcase
  end
end

class Output
  def initialize(session)
    @session = session
    # @message
    case @choice
    when 'a'
      @message = "The number of words in your message:"
      @session.text = @session.text.split(" ").size
    when 'b'
      @message = "The number of letter in your message:"
      @session.text = @session.text.split("").size
    when 'c'
      @message = "Your message in reverse:"
      @session.text = @session.text.reverse
    when 'd'
      @message = "Your message in all lowercase:"
      @session.text = @session.text.downcase
    else
      puts "you suck"
    end
    actionresults # counttt = Countwords.new #call the class
  end

  def actionresults
    puts "#{@message} #{@text}"
  end
end

# class Countwords
# end
bill=User.new
authh=Authenticate.new(bill)
sess = Session.new
outty = Output.new(sess)

@player.move_valid?(@char) ? ((@player.move_to_room(@char)) && (puts "You head South")) : (puts "That is not an exit")
