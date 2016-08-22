class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

# homes.each do |hm|
  # puts "#{hm.name}\'s place in #{hm.city} \nPrice: $#{hm.price} a night"
# end


homeprices = homes.map do |hm|
  hm.price
end

total_price = homes.inject(0.0) do |sum,hm|
  sum + hm.price
end

homes.each_with_index do |hm, index|
  puts "Home Number #{index + 1}: #{hm.name}"
end

home_41_dollars = homes.find do |hm|
  # Is hm's price $41?
  hm.price == 41
end

puts "The first home that costs $41 is:"
puts home_41_dollars.name
