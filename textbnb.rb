class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

#yo
homes = [
  Home.new("Nizar's place", "Barcelona", 2, 42),
  Home.new("Fernando's place", "Barcelona", 5, 47),
  Home.new("Josh's place", "Barcelona", 3, 41),
  Home.new("Gonzalo's place", "Barcelona", 2, 45),
  Home.new("Ariel's place", "Aberdeen", 4, 49),
  Home.new("Hakeem's Home", "Hartford", 6, 200),
  Home.new("Barry's Bungalow", "Brooklyn", 1, 500),
  Home.new("Carols Cottage", "Cairo", 4, 40),
  Home.new("Arthur's Abode","Aberdeen",4,45),
  Home.new("Pashati's Palace", "Paris",3,600)
]


# puts "Enter a price to find a home with that exact price"
# user_price = gets.chomp
# # if user_price.is_a? Numeric
#
# user_price_home = homes.find {|x| x.price == user_price
# x
# }
# puts user_price_home.name
# # puts "#{user_price_home.name}\'s place in #{user_price_home.city} \nPrice: $#{user_price_home.price} a night\nCapacity: #{user_price_home.capacity}"
# #   cityselectsort.each do |hm|
# # end
# # end

# homes.each do |hm|
  # puts "#{hm.name}\'s place in #{hm.city} \nPrice: $#{hm.price} a night"
# end

sorted_homes = homes.sort {|x,y| x.price <=> y.price}

sorted_homes.each do |hm|
  puts "#{hm.name}\'s place in #{hm.city} \nPrice: $#{hm.price} a night"
end


puts "Would you like to sort high to low?"
input = gets.chomp
if input == "yes"
  high_to_low_sort = homes.sort {|x,y| y.price <=> x.price}

  high_to_low_sort.each do |hm|
    puts "#{hm.name}\'s place in #{hm.city} \nPrice: $#{hm.price} a night"
end
end

puts "Would you like to sort by capacity?"
capacityinput = gets.chomp
if capacityinput == "yes"
  capacitysort = homes.sort {|x,y| y.capacity <=> x.capacity}

  capacitysort.each do |hm|
    puts "#{hm.name}\'s place in #{hm.city} \nPrice: $#{hm.price} a night\nCapacity: #{hm.capacity}"
end
end

puts "Would you like to sort by city?"
citysort = gets.chomp
if citysort == "yes"
  puts "What city would you like to sort by?"
  selectedcity = gets.chomp

  cityselectsort = homes.select {|x| x.city == selectedcity }

  cityselectsort.each do |hm|
    puts "#{hm.name}\'s place in #{hm.city} \nPrice: $#{hm.price} a night\nCapacity: #{hm.capacity}"
  end
else
  puts "fine be that that way!"
end

totepx = cityselectsort.reduce(0) {|sum,hm| sum + hm.price}
avgpx = totepx/cityselectsort.size
puts "The average price is $#{avgpx}"


# puts "Enter a price to find a home with that exact price?"
# user_price = gets.chomp
# if user_price.is_a? Numeric
#
#   user_price_home = homes.find {|x| x.price == user_price }
#   puts user_price_home
# #   cityselectsort.each do |hm|
# #     puts "#{hm.name}\'s place in #{hm.city} \nPrice: $#{hm.price} a night\nCapacity: #{hm.capacity}"
# # end
# end

puts "Enter a price to find a home with that exact price"
user_price = gets.chomp.to_i
# if user_price.is_a? Numeric

user_price_home = homes.find {|x| x.price == user_price}
puts "*A matching home is*\n#{user_price_home.name}\'s place in #{user_price_home.city} \nPrice: $#{user_price_home.price} a night\nCapacity: #{user_price_home.capacity}"
# puts "#{user_price_home.name}\'s place in #{user_price_home.city} \nPrice: $#{user_price_home.price} a night\nCapacity: #{user_price_home.capacity}"
#   cityselectsort.each do |hm|
# end
# end
