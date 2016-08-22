require 'pry'


class Item
  attr_accessor :name, :price
  def initialize(name,price)
    @name=name
    @price=price
  end #solve based on slides
end

class Apple < Item
  def initialize
    super("apple",10)
  end
end

class Orange < Item
  def initialize
    super("orange",5)
  end
end

class Grapes < Item
  def initialize
    super("grapes",15)
  end
end

class Banana < Item
  def initialize
    super("banana",20)
  end
end

class Watermelon < Item
  def initialize
    super("watermelon",50)
  end
end

class ShoppingCart
  def initialize
    @@cart = {} # EACH ITEM IN CART WILL BE KEY VALUE PAIR WITH [{orange => 5} => 10, {apple => 10} => 2] item and quantitiy
  end

  def add_item_to_cart(item)
    item.each do |key,value|
      if @@cart[key] != nil
        puts @@cart[key][:quantity]
      else
        @@cart[key] = [value]#pushes items into cart
      end
    end
  end

  def show
    puts @@cart
  end


end

# :ITEM => [PRICE,QUANTITY]
cart = ShoppingCart.new
# cart.add_item_to_cart({:orange => [1,2]})
cart.show
# fruits = {apple: Apple}
thing = {:orange=>{:price => 5,:quantity => 1}}
cart.add_item_to_cart(thing)
cart.show
cart.add_item_to_cart(thing)
cart.show
