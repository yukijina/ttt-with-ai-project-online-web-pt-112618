class Game
  attr_accessor :board, :player_1, :player_2, :current_player

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  def initialize(player_1= Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @current_player = @player_1
  end


  def won?
    win_array = WIN_COMBINATIONS.detect do |win_comb|
      empty_string = " "
      self.board.cells[win_comb[0]] == self.board.cells[win_comb[1]] &&  self.board.cells[win_comb[1]] == self.board.cells[win_comb[2]] && self.board.cells[win_comb[0]] != empty_string
      end
      if win_array.nil?
        false
      else
        win_array
      end

  end

  def draw?
    self.board.full? && !won?
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if self.won? == false
      nil
    elsif self.board.cells[self.won?[0]] == "X"
      "X"
    elsif self.board.cells[self.won?[0]] == "O"
      "O"
    end
  end

  def turn
    input = self.current_player.move(self.board).to_i
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      if self.current_player == self.player_1
        self.current_player = self.player_2
      else
        self.current_player = self.player_1
      end
    else
      puts "Please type the number between 1 and 9:"
      turn
    end
  end

  def play
    puts "Please type the number between 1 and 9: "
    !draw?
    until over?
      turn
    end
    !draw?
    won?
      puts "Congratulations #{self.winner}!"
    draw?
      puts "Cat's Game!"
  end


end
