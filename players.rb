class Players
    attr_accessor :name, :game_piece
  
      def initialize(name, game_piece, board)
          @name = name
          @game_piece = game_piece
          @board = board
      end
  
  
      def move
          get_position
          if valid_position(@position)
            if @board.move_piece(@position, @game_piece)
              true
            else 
              move
            end
          else
              puts
              puts "Choose a position 1 through 9."
              move
          end
      end
  
      def get_position
          puts "What's your move, #{@name}: #{@game_piece}?"
          @position = gets.chomp.to_i
      end
  
      def valid_position(position)
        if (1..9).include? position
          true
        elsif !position.is_a? Integer  
          false
        else
          false
        end
      end
      
  end