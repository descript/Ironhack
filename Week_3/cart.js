var Item = function(name, price) {
  this.name = name;
  this.price = price;
};

var ShoppingCart = function() {
  var cart_list = [];

  this.addItem = function(newitem) {
    cart_list.push(newitem);
    console.log("Adding " + newitem.name + " to the cart at a price of $" + newitem.price);
  }

  this.showCart = function() {
    return cart_list[0];
  }
};



var apple = new Item("apple",10);
var orange = new Item("orange",5);
var grapes = new Item("grapes",15);
var banana = new Item("banana",20);
var watermelon = new Item("watermelon",50);

var mycart = new ShoppingCart();
mycart.addItem(apple)
mycart.showCart
