#= A Dungeon Text Adventure
#
#== History
#
#Text adventures were popular in the _1980s_, but have fallen out of favor with modern gamers seeking grafical
#thrills. They're *perfect playgrounds* for experimenting with classes and objects, though, as replicating the real
#world in a virtual form requires a complete understanding of mapping real-world concepts into classes.
#
#== Additional Info
#
#http://en.wikipedia.org/wiki/Adventure_game
#
#== Classes Structure
#
#--
# Hidden comment starts:
# AE, please add a description of the classes here
# Because we realy need to lauch this!
#++
#
#* Dungeon
#  * Player
#  * Room
#
#== Examples
#
# my_dungeon = Dungeon.new('Andrey')
# my_dungeon.add_room(:largecave, 'Large Cave', 'a large cavernous cave', {:west => :smallcave})
# my_dungeon.add_room(:smallcave, 'Small Cave', 'a small, claustrophobic cave', {:east => :largecave, :south => :scraycave, :north => :happycave})
# my_dungeon.add_room(:scarycave, 'Scary Cave', 'a very scary room with bloody walls', {:norh => :smallcave})
# my_dungeon.add_room(:happycave, 'Happy Cave', 'a cozy room with the table full of food and drinks', {:south => :smallcave})
# my_dungeon.start(:smallcave)
#
#
#A general class that encapsulates the entire concept of the dungeon game.
class Dungeon
  attr_accessor :player

  # Create a new player object and store a name
  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms  = []
  end

  # Add a room object to the class var @rooms
  def add_room(reference, name, description, connections)
    @rooms  << Room.new(reference, name, description, connections)
  end

  # Start a game from the given location
  def start(location)
    @player.location = location
    puts @player.name + ", welcome to the game!\n\n"
    show_current_description
  end

  # Show the description of the room
  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  # Using reference find a room in @rooms array
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end

  # Using direction find a room in connections array
  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  # Move to a diven direction
  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  # The player provides the link between the dungeon and you. All experience of the dungeon comes
  # through the player. The player can move between rooms in the dungeon.
  class Player
    attr_accessor :name, :location

    def initialize(name) #:nodoc
      @name = name
    end
  end

  # The rooms of the dungeon are the locations taht the player can navigate between. These will be linked together
  # in multiple ways (doors to the north, west, east and south) and have descriptions.
  class Room #:nodoc: all
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description + "\n\n Where do you go next?\n\n"
    end
  end


end

# Test 1
my_dungeon = Dungeon.new('Andrey')
my_dungeon.add_room(:largecave, 'Large Cave', 'a large cavernous cave', {:west => :smallcave})
my_dungeon.add_room(:smallcave, 'Small Cave', 'a small, claustrophobic cave', {:east => :largecave, :south => :scraycave, :north => :happycave})
my_dungeon.add_room(:scarycave, 'Scary Cave', 'a very scary room with bloody walls', {:norh => :smallcave})
my_dungeon.add_room(:happycave, 'Happy Cave', 'a cozy room with the table full of food and drinks', {:south => :smallcave})
my_dungeon.start(:smallcave)

loop do
  user_input = gets
  direction  = user_input.chomp.to_sym
  my_dungeon.go(direction)
end



#my_dungeon.go(:north)
