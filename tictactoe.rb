require 'byebug'

class Board

attr_accessor :fields, :position, :board

Winning_Combinations = [
[1,2,3],
[4,5,6],
[7,8,9],
[1,4,7],
[2,5,8],
[3,6,9],
[1,5,9],
[3,5,7]
]

  def initialize
     self.fields =  {
        '1' => ' ', '2' => ' ', '3' => ' ',
        '4' => ' ', '5' => ' ', '6' => ' ',
        '7' => ' ', '8' => ' ', '9' => ' '
      }
   end


   def set_stone_at(position, stone)
     fields[position] = stone
   end

   def stone_at(position)
     stone = fields[position]
   end

   def show
    puts fields
   end

   def valid_position?(position)
     if (1..9).member?(position.to_i) == true
       true
     else
       false
     end
   end

   def valid_move?(position)
     if stone_at(position) == "X" || stone_at(position) == "O"
       false
     else
      true
     end
   end

   def winner?

       Winning_Combinations.each do |array|
        if stone_at(array[0].to_s) == "X" || stone_at(array[0].to_s) == "O"
         if stone_at(array[0].to_s) ==  stone_at(array[1].to_s)  &&  stone_at(array[1].to_s) == stone_at(array[2].to_s)
  #Check that one of them is x or 0 for it not to be
           puts "Winner! The winner is #{stone_at(array[0].to_s)}"
            true
          else
            false
          end
        else
          false

       end
     end
  end


end

class Game
attr_accessor :board
attr_accessor :position

  def initialize
   self.board = Board.new
  end

  def print_board
     puts "\n  #{board.stone_at('1')} | #{board.stone_at('2')} | #{board.stone_at('3')}"
     puts "  --+---+---"
     puts "  #{board.stone_at('4')} | #{board.stone_at('5')} | #{board.stone_at('6')}"
     puts "  --+---+---"
     puts "  #{board.stone_at('7')} | #{board.stone_at('8')} | #{board.stone_at('9')} \n"
   end


  def ask_user_for_move
    puts "\n Select your move. Choose a position from 1 to 9:\n"
    @position = gets.chomp
    system("clear")
  end

  def next_stone
    if  @turn_count.even? == true
    board.set_stone_at(position, "X")
    else
      board.set_stone_at(position, "O")
    end
  end


  def start_game
    # system("clear")
    @turn_count = 0
    while board.winner? != true
      ask_user_for_move
        if board.valid_position?(position) == true && board.valid_move?(position) == true
          next_stone
          @turn_count = @turn_count + 1
        else
          puts "This is not a valid move. Please choose a position from 1 to 9 which is not taken!"
        end
      print_board
    end
  end

end


#
board = Board.new
# board.show
#
#
# board.stone_at('2')  # => expect nil
#
# board.set_stone_at('2', 'O')
# board.stone_at('2')  # => expect 'O'
#
# board.set_stone_at('3', 'X')
# board.show
# # board.print_board
#
# Game.new.board.show
#
# game = Game.new
# game.board.set_stone_at('1', 'X')
# game.board.set_stone_at('2', 'X')
# game.board.set_stone_at('3', 'O')
# game.board.set_stone_at('4', 'O')
# game.board.set_stone_at('6', 'X')
# game.board.set_stone_at('7', 'O')
# game.board.set_stone_at('8', 'X')
# game.print_board


# board.valid_position?(8)

game = Game.new
# game.next_stone
game.start_game
