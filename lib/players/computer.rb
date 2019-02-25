module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      computer_move = rand(1..9)
      #board.valid_move?(computer_move)
      valid_moves if valid_moves.include?(computer_move.to_s) && board.valid_move?(computer_move)

    end

  end
end

# describe '#move' do
#   it 'returns a valid position for the computer to move' do
#     computer = Players::Computer.new("X")
#     board = Board.new
#
#     valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#
#     computer_move = computer.move(board)
#
#     expect(valid_moves).to include(computer_move)
