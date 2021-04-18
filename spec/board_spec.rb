require "./lib/board.rb"
require "rspec"

RSpec.describe Board do
    context "creating a new board" do
        subject { Board.new }
        describe "#initialize" do
            it "should create an empty array of size 7" do
                expect(subject.board.size).to eql(7)
            end
    
            it "should contain 7 empty arrays of size 6" do
                expect(subject.board.all? {|column| column.size == 6}).to eq true   
            end
        end
    end

    context "checking validity of moves" do
        describe "#valid_move?" do
            it "should return true if column filled" do
                board = Board.new
                # check 1st (0th) column
                expect(board.valid_move?(1)).to eq true
            end

            it "should return false if column filled" do
                board = Board.new
                # fill column
                board.board[0][0..5] = "X"
                # check 1st (0th) column
                expect(board.valid_move?(1)).to eq false
            end
        end

        describe "#check_columns" do
            it "should return true if four same connected in column" do
                board = Board.new
                board.board[0][0] = "X"
                board.board[0][1] = "X"
                board.board[0][2] = "X"
                board.board[0][3] = "X"
                expect(board.check_columns).to eq true
            end
            it "should return false if no four same connected in column" do
                board = Board.new
                board.board[0][0] = "X"
                board.board[0][1] = "O"
                board.board[0][2] = "X"
                board.board[0][3] = "X"
                expect(board.check_columns).to eq false
            end
        end

        describe "#check_rows" do
            it "should return true if four same connected in a row" do
                board = Board.new
                board.board[1][0] = "X"
                board.board[2][0] = "X"
                board.board[3][0] = "X"
                board.board[4][0] = "X"
                expect(board.check_rows).to eq true
            end
            it "should return false if no four same connected in a row" do
                board = Board.new
                board.board[1][0] = "X"
                board.board[2][0] = "X"
                board.board[3][0] = "O"
                board.board[4][0] = "X"
                expect(board.check_rows).to eq false
            end
        end

        describe "#check_diagonals" do
            it "should return true if four same connected in a forward diagonal" do
                board = Board.new
                board.board[0][0] = "X"
                board.board[1][1] = "X"
                board.board[2][2] = "X"
                board.board[3][3] = "X"
                expect(board.check_diagonals).to eq true
            end
            it "should return false if no four same connected in a forward diagonal" do
                board = Board.new
                board.board[0][0] = "O"
                board.board[1][1] = "X"
                board.board[2][2] = "X"
                board.board[3][3] = "X"
                expect(board.check_diagonals).to eq false
            end

            it "should return true if four same connected in a backward diagonal" do
                board = Board.new
                board.board[6][0] = "X"
                board.board[5][1] = "X"
                board.board[4][2] = "X"
                board.board[3][3] = "X"
                expect(board.check_diagonals).to eq true
            end
            it "should return false if no four same connected in a backward diagonal" do
                board = Board.new
                board.board[6][0] = "O"
                board.board[5][1] = "X"
                board.board[4][2] = "X"
                board.board[3][3] = "X"
                expect(board.check_diagonals).to eq false
            end
        end
        
    end

end