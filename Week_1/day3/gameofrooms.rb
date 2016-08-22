require 'pry'

class Game
  def initialize(rooms)
    @rooms = rooms
    @player = Player.new
    @load_bool = 0
    puts "\n\n__xxx***You are trying to escape a maze of rooms.***xxx__\n\nEach room has up to 4 possible exits:\nNorth: 'N'\nSouth: 'S'\nEast: 'E'\nWest: 'W'\nExit the game: 'Q'\nCurrent room's info: 'room?'\nHint for current room: 'hint?\nCheck room: 'look around'\nPick up item in the room: 'get item'\nCheck inventory: 'inventory?'\nSet down item in room: 'drop item'"
  end

  def save_game
      open('roomsave.txt', 'w') {|f|
        f.print "#{@player.locate[:title]}\n"
        f.print "#{@player.check_inventory}\n"
        f.print "#{@rooms}\n"
      }
  end

  def load_game
    @load_game = IO.readlines('roomsave.txt')
    @player.set_location(@rooms[@load_game[0].chomp.to_sym])
    @player.inventory = @load_game[1].chomp.gsub(/(\[\"|\"\])/, '').split('", "') #strips out unnecessary characters and converts to array
    @rooms = eval(@load_game[2].chomp) #converts the string to a hash
    binding.pry
  end

  def start_game
    # @rooms = rooms
    print "\nEnter any command to begin\n"
    @player.set_location(@rooms[:jailcell]) # : @player.set_location(@rooms[@load_game[0].chomp.to_sym]) #puts player into the  jailcell as starting room
      while @char != "Q"
        print ">"
        @char = gets.chomp.upcase
        case @char
        when "N" #NORTH----
          @player.move_valid?(@char) ? ((@player.move_room(@char,@rooms)) && (puts "You walk North...\n\n#{@player.location[:title]}:\n#{@player.print_exits}")) : (puts "That is not an exit")
        when "S"
          @player.move_valid?(@char) ? ((@player.move_room(@char,@rooms)) && (puts "You head South...\n\n#{@player.location[:title]}:\n#{@player.print_exits}")) : (puts "That is not an exit")
        when "E"
          @player.move_valid?(@char) ? ((@player.move_room(@char,@rooms)) && (puts "Heading East...\n\n#{@player.location[:title]}:\n#{@player.print_exits}")) : (puts "That is not an exit")
        when "W"
          @player.move_valid?(@char) ? ((@player.move_room(@char,@rooms)) && (puts "Westward ho!\n\n#{@player.location[:title]}:\n#{@player.print_exits}")) : (puts "That is not an exit")
        when "ROOM?"
          @player.get_location
        when "HINT?"
          puts @player.get_hint
        when "INVENTORY?"
          puts "You have #{@player.check_inventory.join(', ')} on your person"
        when "EXITS"
          puts @player.print_exits
        when "SAVE GAME"
          save_game
        when "LOAD GAME"
          load_game
        when "LOOK AROUND"
          if @player.find_items.empty?
            puts "The room is empty"
          else
            puts "You see #{@player.find_items.join('')} in the room"
          end
        when "GET ITEM"
          if @player.find_items.empty?
            puts "Thare aint nuthin ta git!"
          else
            @player.pick_up_item
          end
        when "DROP ITEM"
          puts "Which item do you want to drop?"
          item = gets.chomp.upcase
          @player.put_down_item(item)
        end #end case
      end #end while
  end #end method
end #end class

class Player
  attr_accessor :location, :next_room, :inventory
  def initialize
    @location = location #the room they are in
    @inventory = []
  end

  def locate
    @location
  end

  def get_location
    puts "#{@location[:title]}\n\n#{@location[:desc]}"
  end

  def check_inventory
    @inventory
  end

  def get_hint
    @location[:hint]
  end

  def set_location(room) #format needs to be rooms[:symbol_of_room-name]
    @location = room
  end

  def find_exits
    exit_list = []
    @location[:exits].each {|exits,rooms| exit_list << exits}
    exit_list
  end

  def print_exits
    "Exits: #{find_exits.join(', ')}"
  end

  def move_valid?(x)
    @location[:exits].include? "#{x.upcase}" #returns True or False
  end

  def find_linking_room(x)
    @location[:exits][x]
  end

  def move_room(direction,rooms)
    @next_room = find_linking_room(direction).to_sym
    set_location(rooms[@next_room])
  end

  def find_items #returns an array
    if @location[:objects]
      @location[:objects].each {|x| x}
    else
      false
    end
  end

  def pick_up_item
    if find_items
      @inventory << find_items.join('')
      @location[:objects].delete_if {|item| @inventory.include?(item) }
      puts "You picked up #{@inventory[-1]}"
    end
  end

  def put_down_item(thing)
    item_to_drop = @inventory.select {|object| object==thing} #assigns item to drop to be 'thing' in the inventory array
    item_to_drop = item_to_drop.join('') #converts array to a string
    @inventory.delete_if { |item| item==thing} #deletes item from inventory
    @location[:objects] << item_to_drop #puts item into :objects has of the room
  end

end

rooms = {
  :jailcell => {:title => "jailcell",:exits=>{"S" => 'main_hallway'},:objects => ["KEYS"],:hint=>"go South, foolio",:desc=>"You just woke up from a beer drinking contest. You appear to be in an old jail but no one else is here. It appears someone left the south-facing door open..."},
  :main_hallway => {:title=>"main_hallway",:exits=>{"N" => 'jailcell', "E" => 'torture_chamber', "S"=>'yard'},:objects=>[],:hint=>"Just because the hall is dark that doesn't mean it's scary",:desc=>"The hallway is dark, except for the old flickering lights in one corner and light shining through a door to your left. You could keep going South but it is too dark to see what's at the end of the hall"},
  :torture_chamber => {:title=>"torture_chamber",:exits=>{"W"=>'main_hallway'},:objects =>["SAW"],:hint=>"I wonder what Alexa has seen and heard",:desc=>"A modern day torture chamber! With smart lighting to save on the electric bill and torture commands linked to Alexa"},
  :yard => {:title=>"yard", :exits => {"N"=>'main_hallway',"E" => 'yard2',"S"=>'garage',"W"=>'office'},:objects=>[],:hint=>"This courtyard is open, you can go in any diretion",:desc=>"You step outside into a sunny, grassy courtyard. All sides are either fenced in or bordering buildings."},
  :small_yard => {:title=>"Small_yard",:exits=>{"W"=>'yard'},:objects=>[],:hint=>"It's the door you came in! Which unfortunately is the only interesting thing in here",:desc=>"You go through a gate in the main courtyard's fence and end up in a smaller enclosed dirt yard. What's that over there!?"}
}

mygame=Game.new(rooms)
mygame.start_game
