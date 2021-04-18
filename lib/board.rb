class Board
    attr_accessor :board
    def initialize
        @board = Array.new(7) { Array.new(6) }
    end

    def drop_piece(piece, column)
        cell = @board[column - 1].count(nil) - 1
        @board[column - 1][cell] = piece
    end

    def valid_move?(column)
        # check if there is no more space in column
        @board[column - 1].count(nil) == 0 ? false : true
    end

    def finished?
        if draw?
            return "draw"
        elsif win?
            return "win"
        else
            return false
        end
    end

    def draw?
        @board.each do |column|
            return true if column.none? {|cell| cell.nil?}
        end
        return false
    end

    def win?
        return true if check_columns() or check_rows() or check_diagonals()
    end

    def check_columns
        0.upto(6) do |x|
            0.upto(2) do |y|
                if @board[x][y...y+4].uniq.size == 1 and @board[x][y] != nil
                    return true
                end
            end
        end
        return false
    end

    def check_rows
        0.upto(5) do |y|
            0.upto(3) do |x|
                if @board[x][y] == @board[x + 1][y] and @board[x][y] == @board[x + 2][y] and @board[x][y] == @board[x + 3][y] and @board[x][y] != nil
                        return true
                end
            end
        end
        return false
    end

    def check_diagonals
        0.upto(2) do |x|
            0.upto(3) do |y|
                if @board[x][y] == @board[x+1][y+1] && @board[x][y] == @board[x+2][y+2] && @board[x][y] == @board[x+3][y+3] and @board[x][y] != nil
                    return true
                end
            end
        end
        6.downto(3) do |x|
            0.upto(3) do |y|
                if @board[x][y] == @board[x - 1][y + 1] and @board[x][y] == @board[x - 2][y + 2] and @board[x][y] == @board[x - 3][y + 3] and @board[x][y] != nil
                    return true
                end
            end
        end
        return false
    end
end