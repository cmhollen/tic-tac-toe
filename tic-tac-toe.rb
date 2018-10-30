require './board.rb'
require './players.rb'

class Play
    def initialize
      @board = Board.new
      @player_1 = Players.new("Player 1", "X", @board)
      @player_2 = Players.new("Player 2", "O", @board)
      
      @current_player = @player_1
      puts "Rules: Choose where to lay your game piece."
      puts "Three in a row wins the game!"
      puts "Enter the square number you want to place your game piece at."
      
    end

    def play_round
        loop do

          @board.display

          @current_player.move
          
          break if game_over?

          switch
          
        end
    end

    def switch
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def game_over?
        if winner? || draw?
            true
        else
            false
        end
    end

    def winner?
        if @board.three_in_a_row?(@current_player.game_piece)
            puts
            puts "THREE IN A ROW! You win #{@current_player.name}! :)"
            @board.display
            true
        end
    end

    def draw?
        if @board.full_board
            puts
            puts "It's a draw."
            @board.display
            true
        end
    end
end





p = Play.new
p.play_round