require_relative 'format.rb'

module Messages
    # text
    INTRO = "Welcome to Connect Four!".blue

    # input
    CHOOSE_COLUMN = "Choose a column " + "(1 - 7)".green.italic + ":"
    INVALID_INPUT = "Invalid input.".red
    INVALID_MOVE = "Invalid move, column is filled!".red

    # results
    WIN = " has won the game!"
    DRAW = "It's a draw!".brown
end