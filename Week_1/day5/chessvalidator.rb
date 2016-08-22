require 'pry'
#ENTIRE GAME FROM WHITE'S PERSPECTIVE
class Board
  def initialize
    @grid = [['a','b','c','d','e','f','g','h'],[1,2,3,4,5,6,7,8]]
    @board = [[:wR,:wN,:wB,:wQ,:wK,:wB,:wN,:wR],
              [:wP,:wP,:wP,:wP,:wP,:wP,:wP,:wP],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [nil,nil,nil,nil,nil,nil,nil,nil],
              [:bP,:bP,:bP,:bP,:bP,:bP,:bP,:bP],
              [:bR,:bN,:bB,:bQ,:bK,:bB,:bN,:bR]
            ]
  end

  def transform_aN_to_board(z8) #z8 used because thats what input looks like
    z8 = z8.to_s.split('')
    @x=z8[0] #need to lookup x's index
    @y=z8[1].to_i-1
    @x = @grid[0].index(@x)
    f = [@x,@y] #put into an array for the check_path method
  end

  def check_square(y7)
    transform_aN_to_board(y7)
    @board[@y][@x]
  end

  def print_board
    @board.each do |v|
      puts v.each {|h| h }.join(" ")
    end
  end

end
#piece class and hard code piece into board and will have to ass iece to board
class Rook

  def validate(board,origin,destination) #destination format should be "a1" format
    @origin = origin
    @destination = destination
    @myboard = board

    is_square_occupied?
    enumerate_path
    check_path
  end

  def is_square_occupied?
    if @myboard.check_square(@destination).is_a?(Symbol) && @myboard.check_square(@destination).to_s.split('')[0] == "w"#if a peice is already on the space
      puts "your own white piece is already on it"
    elsif @myboard.check_square(@destination).is_a?(Symbol) && @myboard.check_square(@destination).to_s.split('')[0] == "b"#if a peice is already on the space
      puts "move is valid and you can capture the piece"
    else #space must be nil and thus unoccupied
      # true
      puts "unoccupied space and thus valid move for rook"
    end
  end


def enumerate_path #LOGIC FOR ROOK
    @difference = [0,0]
    unless (@origin[1] == @destination[1]) #NUMBERS. WILL BE TRUE OR FALSE
      @difference[1] = (@destination[1].to_i - @origin[1].to_i)
    end
    unless (@origin[0] == @destination[0]) #LETTERS. WILL BE TRUE OR FALSE
      @difference[0] = ( @myboard[0].index(@destination[0]) - @myboard[0].index(@origin[0]) )#index of the letters
    end
    print @difference
  end

  def check_path #for obstacles
    k = @difference[0]
    l = @difference[1]
    num = [k,l].max
    i=1
    # @sml_array = []
    @master_array = []
    origin_array = @myboard.transform_aN_to_board(@origin) #converts origin to array so I can operte on it
    #need to run check_square on every iteration from origon to  dest
    while i<=num
      origin_array.each_cons(2) do |c,v| binding.pry
        [(c+=1),(v+=1)]
        # @master_array << @sml_array
        i+=1
      end
    end

  end
end

=begin
  def list_squares_to_travel_through
    # check_piece_on_square #need to repeatdely call CPOS, and increment until i go through the @difference
  end

end

  def check_piece_on_square(x,y)
    i=0
    @piece_position.select do |piece,position_array|
      if position_array[0] == x && position_array[1] == y
        i+=1
        puts piece
      end #NEED TO PRINT EMPTY
    end
    if i == 0
      puts "Empty"
    end
  end

  def validator(the_board,origin,destination)#destination must be array [x,y] x is letter y is number
    @the_board = the_board
    @origin = origin
    @destination = destination
    if check_piece_on_square(destination[0],destination[1]) == "Empty"
      true
    else
      false
    end
    enumerate_path
  end



  end
=end
  # end
#
my_board = Board.new
# puts my_board.check_square("e8")
rooky = Rook.new
rooky.validate(my_board,"a2","a6")
# rooky.enumerate_path
