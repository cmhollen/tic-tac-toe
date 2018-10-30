class Board

    def initialize
        @board = Array.new(9){|i| i + 1}
    end

    def display
        puts
        puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts "---------- "
        puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts "---------- "
        puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
        puts
    end
    

    def move_piece(position, game_piece)
        
          if @board[position - 1].is_a? Integer
            @board[position - 1] = game_piece
            true
          else
            puts
            puts "There's already a piece here. Choose again"
            false
          end
        
    end

    def three_in_a_row?(game_piece)
        if three_across?(game_piece) || three_down?(game_piece) || three_diagonal?(game_piece)
            return true
        else
            return false
        end
    end

    def three_across?(game_piece)
        if [@board[0], @board[1], @board[2]].all? { |e| e == game_piece }
          return true
        elsif [@board[3], @board[4], @board[5]].all? { |e| e == game_piece }
          return true
        elsif [@board[6], @board[7], @board[8]].all? { |e| e == game_piece }
          return true
        end
    end

    def three_down?(game_piece)
        if [@board[0], @board[3], @board[6]].all? { |e| e == game_piece }
          return true
        elsif [@board[1], @board[4], @board[7]].all? { |e| e == game_piece }
          return true
        elsif [@board[2], @board[5], @board[8]].all? { |e| e == game_piece }
          return true
        end
    end

    def three_diagonal?(game_piece)
        if [@board[0], @board[4], @board[8]].all? { |e| e == game_piece }
          return true
        elsif [@board[2], @board[4], @board[6]].all? { |e| e == game_piece }
          return true
        end
    end

    def full_board
      @board.all? { |e| e.is_a? String }
    end


end