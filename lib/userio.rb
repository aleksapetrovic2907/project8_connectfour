require_relative 'messages.rb'
require_relative 'format.rb'
require_relative 'board.rb'

class UserIO
    include Messages
    def self.print_menu
        puts INTRO
    end

    def self.clear_screen
        puts `clear`
    end

    def self.choose_column(current_player_name)
        puts "#{current_player_name}".blue.bold + ", #{CHOOSE_COLUMN}"
        input = gets.chomp
        return input.to_i if input.match('^[1-7]{1}$')

        puts INVALID_INPUT
        self.choose_column(current_player_name)
    end

    def self.invalid_move
        puts INVALID_MOVE
    end

    def self.finish(status, current_player_name)
        if status == "win"
            puts "#{current_player_name}".blue.bold + WIN
        else
            puts DRAW
        end
    end

    def self.print_board(board)
        6.times do |y|
            7.times do |x| 
                print "|".bold
                if board[x][y] == nil
                    print "_".bold
                elsif board[x][y] == "X"
                    print "●".red
                else
                    print "●".blue
                end
                print "|".bold
            end
            print "\n"
        end
        puts " 1  2  3  4  5  6  7".green.bold
    end
end