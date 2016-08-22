require 'pry'

class Game
  def initialize
    @player = Player.new
    puts "\n\n__xxx***You are trying to escape a maze of rooms.***xxx__\n\nEach room has up to 4 possible exits:\nNorth: 'N'\nSouth: 'S'\nEast: 'E'\nWest: 'W'\nExit the game: 'Q'\nCurrent room's info: 'room?'\nHint for current room: 'hint?'"
  end

  def save_game
      @save_contents = [@player.locate[:title],@player.check_inventory,@rooms
      IO.write('roomsave.txt',@save_contents)
  end

  def load_game#
    @load_game = IO.readlines('roomsave.txt')
  end

  def start_game(rooms)
    @loc_tracker = ""
    @rooms = rooms
    print "Enter any command to begin"
    @player.set_location(rooms[:jailcell]) #puts player into the  jailcell as starting room
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
  attr_accessor :location, :next_room
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
    @loc_tracker=1 ##does not ahve access to @rooms, even though I initialize player inside of Game?
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
    @location[:objects] << @inventory.select {|object| object==thing}
  end

end

rooms = {
  :jailcell => {:title => "Jailcell",:exits=>{"S" => 'main_hallway'},:objects => ["KEYS"],:hint=>"go South, foolio",:desc=>"You just woke up from a beer drinking contest. You appear to be in an old jail but no one else is here. It appears someone left the south-facing door open..."},
  :main_hallway => {:title=>"Main Hallway",:exits=>{"N" => 'jailcell', "E" => 'torture_chamber', "S"=>'yard'},:hint=>"Just because the hall is dark that doesn't mean it's scary",:desc=>"The hallway is dark, except for the old flickering lights in one corner and light shining through a door to your left. You could keep going South but it is too dark to see what's at the end of the hall"},
  :torture_chamber => {:title=>"Torture Chamber",:exits=>{"W"=>'main_hallway'},:objects =>["SAW"],:hint=>"I wonder what Alexa has seen and heard",:desc=>"A modern day torture chamber! With smart lighting to save on the electric bill and torture commands linked to Alexa"},
  :yard => {:title=>"Yard", :exits => {"N"=>'main_hallway',"E" => 'yard2',"S"=>'garage',"W"=>'office'},:hint=>"This courtyard is open, you can go in any diretion",:desc=>"You step outside into a sunny, grassy courtyard. All sides are either fenced in or bordering buildings."},
  :yard2 => {:title=>"Small yard",:exits=>{"W"=>'yard'},:hint=>"It's the door you came in! Which unfortunately is the only interesting thing in here",:desc=>"You go through a gate in the main courtyard's fence and end up in a smaller enclosed dirt yard. What's that over there!?"}
}

mygame=Game.new
mygame.start_game(rooms)
