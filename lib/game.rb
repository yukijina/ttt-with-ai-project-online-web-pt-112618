class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :current_player

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  def initialize(player_1= Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = @player_1
  end

  def won?
    @result =WIN_COMBINATIONS.select do |win_comb|
      if self.board.cells[win_comb[0]] == self.board.cells[win_comb[1]] &&  self.board.cells[win_comb[1]] == self.board.cells[win_comb[2]]
        win_comb
      end
    end.flatten
    @result == [] ? false : @result

  end

  def draw?
    !self.board.cells.include?(" ") && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if won?
      if self.board.cells[@result[0]] == "X"
        "X"
      elsif self.board.cells[@result[0]] == "O"
        "O"
      end
    else
      nil
    end
  end

  def turn
    if self.board.valid_move?(self.current_player.move(board).to_i)
       if @current_player == @player_1
          @current_player = @player_2
       else
         @current_player = @player_1
       end
    else
      self.board.valid_move?(self.current_player.move(board).to_i)
    end
  end

  def play
    puts "Please type the number between 1 and 9: "

    while !over?
    input = self.current_player.move(board).to_i
    self.board.update(input, @current_player)
    turn
    end


  end


end
