require_relative 'userio.rb'
require_relative 'board.rb'
require_relative 'player.rb'
class Game
    attr_accessor :board, :player1, :player2, :current_player, :input
    def initialize()
        @board = Board.new
        @player1 = Player.new("Player 1", "X")
        @player2 = Player.new("Player 2", "O")
        @current_player = @player1
        @input = nil
    end

    def start
        UserIO.print_menu
        loop do
            play_round
        end
    end

    def play_round
        display()
        get_move()
        check_if_finished()
        switch_player_turn()
    end

    def display()
        UserIO.clear_screen()
        UserIO.print_board(@board.board)
    end

    def get_move
        @input = UserIO.choose_column(@current_player.name)
        if @board.valid_move?(@input)
            @board.drop_piece(@current_player.piece, @input) 
        else
            UserIO.invalid_move
            get_move
        end
    end

    def check_if_finished
        status = @board.finished?
        if status
            display() # repeat once more so the finishing piece is displayed
            UserIO.finish(status, @current_player.name)
            exit(0)
        end
    end

    def switch_player_turn
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end
end